import '../util/extensions/json_parser_extension.dart';

class AuthTo {
  final String email;
  final String password;
  AuthTo(
    this.email,
    this.password,
  );

  factory AuthTo.fromRequest(String body) {
    var map = JsonParser.fromJson(body);
    return AuthTo(map['email'], map['password']);
  }
}
