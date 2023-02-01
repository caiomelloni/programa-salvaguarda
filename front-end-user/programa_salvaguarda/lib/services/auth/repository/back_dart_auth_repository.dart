import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:programa_salvaguarda/services/auth/errors/auth_exceptions.dart';
import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/services/auth/repository/auth_stream_repository.dart';
import 'package:programa_salvaguarda/util/custom_env.dart';

import '../requests/auth_http_request.dart';

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
    var user = await AuthHttpRequest.getUserFromToken(_token);
    _emitUser(user);
  }

  @override
  Stream<SalvaGuardasUser?> onAuthStateChange() => _streamBroadcast;

  @override
  Future<void> signIn(String email, String password) async {
    if (email.replaceAll(" ", "") == "" || password.replaceAll(" ", "") == "") {
      throw InsufficientInformationAuthException();
    }

    var body = await AuthHttpRequest.signInAndGetUserJson(email, password);
    String? error = body['error'];
    if (error != null) {
      if (error == "Wrong Password") {
        throw WrongPasswordAuthException();
      }
      if (error == "User Not Found") {
        throw UserNotFoundAuthException();
      }
    }
    secureStorage.write(key: "token", value: body['token']);
    _token = body['token'];
    _emitUser(SalvaGuardasUser.fromJson(body));
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

    await AuthHttpRequest.signUpUser(name!, lastName!, email!, cellphone!,
        role!, university!, course!, senha!);
  }

  @override
  Future<void> updateUser(String name, String lastName, String email,
      String phoneNumber) async {
        _emitUser(await AuthHttpRequest.updateUser(name, lastName, email, phoneNumber, _token!));
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
