import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:programa_salvaguarda/services/auth/errors/auth_exceptions.dart';
import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/services/auth/repository/auth_stream_repository.dart';
import 'package:programa_salvaguarda/util/custom_env.dart';

class BackDartAuthRepository implements AuthStreamRepository {
  final StreamController<SalvaGuardasUser?> _authStreamController =
      StreamController<SalvaGuardasUser?>();
  late Stream<SalvaGuardasUser?> _streamBroadcast;
  final secureStorage = const FlutterSecureStorage();
  String? _token;

  void _emitUser(SalvaGuardasUser? user) =>
      _authStreamController.sink.add(user);

  BackDartAuthRepository() {
    _streamBroadcast = _authStreamController.stream.asBroadcastStream();
  }

  @override
  Future<void> initService() async {
    _token = await secureStorage.read(key: 'token');
    if (_token == null) return;
    var res = await http.get(
      Uri.parse("${CustomEnv.url}/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $_token',
      },
    );
    var userJson = {
      "user": jsonDecode(res.body),
      "token": _token,
    };
    var user = SalvaGuardasUser.fromJson(userJson);
    _emitUser(user);
  }

  @override
  Stream<SalvaGuardasUser?> onAuthStateChange() => _streamBroadcast;

  @override
  Future<void> signIn(String email, String password) async {
    if (email.replaceAll(" ", "") == "" || password.replaceAll(" ", "") == "") {
      throw InsufficientInformationAuthException();
    }

    var req = {
      "email": email,
      "password": password,
    };
    var res = await http.post(Uri.parse("${CustomEnv.url}/login/signin"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(req));
    var body = jsonDecode(res.body);
    String? error = body['error'];
    if (error != null) {
      if (error == "Wrong Password") {
        throw WrongPasswordAuthException();
      }
      if (error == "User Not Found") {
        throw UserNotFoundAuthException();
      }
    }
    var bodyJson = jsonDecode(res.body);
    secureStorage.write(key: "token", value: bodyJson['token']);
    _token = bodyJson['token'];
    _emitUser(SalvaGuardasUser.fromJson(bodyJson));
  }

  @override
  Future<void> signOut() async {
    secureStorage.delete(key: "token");
    _emitUser(null);
  }

  @override
  Future<void> signUp(
      String? name,
      String? lastName,
      String? email,
      String? cellphone,
      String? course,
      String? university,
      String? role,
      String? senha,
      String? senhaConfirmada) async {
    List<String?> options = [
      name,
      lastName,
      email,
      cellphone,
      course,
      university,
      role,
      senha,
      senhaConfirmada
    ];
    bool anyInvalidField = options.any((element) {
      if (element == null) return true;
      String parsed = element.replaceAll(" ", "");
      if (parsed == "") return true;
      return false;
    });
    if (anyInvalidField) throw InsufficientInformationAuthException();
    if (senha != senhaConfirmada) throw WrongPasswordConfimationAuthException();

    var req = {
      "user": {
        "name": "$name $lastName",
        "email": email,
        "cellphone": cellphone,
        "role": role,
        "university": university,
        "course": course,
        "password": senha,
      }
    };
    await http.post(
      Uri.parse("${CustomEnv.url}/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(req),
    );
  }

  @override
  Future<void> updateUser(String? name, String? lastName, String? email,
      String? phoneNumber) async {
    var body = {
      "name": '$name $lastName',
      "email": email,
      "cellphone": phoneNumber,
    };

    var res = await http.patch(
      Uri.parse("${CustomEnv.url}/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $_token',
      },
      body: jsonEncode(body),
    );

    var userJson = {"user": jsonDecode(res.body), "token": _token};
    _emitUser(SalvaGuardasUser.fromJson(userJson));
  }

  @override
  Future<void> refreshUserState() async {
    var res = await http.get(
      Uri.parse("${CustomEnv.url}/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $_token',
      },
    );
    var userJson = {
      "user": jsonDecode(res.body),
      "token": _token,
    };
    var user = SalvaGuardasUser.fromJson(userJson);
    _emitUser(user);
  }
}
