import 'package:http/http.dart' as http;
import 'package:projeto_salvaguarda_admin/services/auth/errors/auth_exceptions.dart';
import 'package:projeto_salvaguarda_admin/services/auth/models/user.dart';
import 'package:projeto_salvaguarda_admin/util/custom_env.dart';
import 'package:projeto_salvaguarda_admin/util/extensions/json_parser_extension.dart';

class AuthHttpRequest {
  static String url = CustomEnv.url;
  static Future<SalvaGuardasAdmin?> getUserFromToken(String? token) async {
    var res = await http.get(
      Uri.parse("${CustomEnv.url}/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    var user = res.statusCode != 200
        ? null
        : SalvaGuardasAdmin.fromJson({
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
    var res = await http.post(Uri.parse("${CustomEnv.url}/auth/signin/admin"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: req.toJson());
    var body = JsonParser.fromJson(res.body);

    return body;
  }

  static Future<void> signUpUser(String name, String lastName, String email,
      String cellphone, String senha) async {
    var req = {
      "user": {
        "name": "$name $lastName",
        "email": email,
        "cellphone": cellphone,
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

  static Future<SalvaGuardasAdmin> updateUser(String name, String lastName,
      String email, String phoneNumber, String token) async {
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
    return SalvaGuardasAdmin.fromJson(userJson);
  }
}
