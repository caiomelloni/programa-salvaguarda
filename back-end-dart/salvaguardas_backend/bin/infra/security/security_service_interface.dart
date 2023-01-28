import 'package:shelf/shelf.dart';

abstract class ISecurityService<T> {
  /// userID é uma claim inserida no payload
  Future<String> generateJWTUser(int userID);
  Future<String> generateJWTAdmin(int userID);

  T? validateJWT(String token);

  Middleware get verifyJWT;
  Middleware get authorization;
}
