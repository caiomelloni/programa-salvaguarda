import 'package:programa_salvaguarda/services/auth/errors/auth_exceptions.dart';
import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/util/custom_env.dart';
import 'package:http/http.dart' as http;
import 'package:programa_salvaguarda/util/extensions/json_parser_extension.dart';

class AuthHttpRequest {
  static String url = CustomEnv.url;
  static Future<SalvaGuardasUser?> getUserFromToken(String? token) async {
    var res = await http.get(
      Uri.parse("${CustomEnv.url}/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    var user = res.statusCode != 200 
        ? null
        : SalvaGuardasUser.fromJson({
            "user": JsonParser.fromJson(res.body),
            "token": token,
          });

    return user;
  }

  static Future<Map<String, dynamic>> signInAndGetUserJson(
      String email, String password) async {
    var req = {
      "email": email,
      "password": password,
    };
    var res = await http.post(Uri.parse("${CustomEnv.url}/auth/signin"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: req.toJson());
    var body = JsonParser.fromJson(res.body);

    return body;
  }

  static Future<void> signUpUser(
      String name,
      String lastName,
      String email,
      String cellphone,
      String role,
      String university,
      String course,
      String senha) async {
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
    var resp = await http.post(
      Uri.parse("${CustomEnv.url}/auth/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: req.toJson(),
    );
    if (resp.statusCode != 200) throw GenericAuthException();
  }

  static Future<SalvaGuardasUser> updateUser(String name, String lastName, String email, String phoneNumber, String token) async {
    var body = {
      "name": '$name $lastName',
      "email": email,
      "cellphone": phoneNumber,
    };

    var res = await http.patch(
      Uri.parse("${CustomEnv.url}/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: body.toJson(),
    );

    var userJson = {"user": JsonParser.fromJson(res.body), "token": token};
    return SalvaGuardasUser.fromJson(userJson);

  }
}
