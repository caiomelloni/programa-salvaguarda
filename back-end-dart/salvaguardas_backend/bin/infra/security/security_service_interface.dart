import 'package:shelf/shelf.dart';

abstract class ISecurityService<T> {
  /// userID é uma claim inserida no payload
  Future<String> generateJWT(int userID, bool isAdmin);

  T? validateJWT(String token);

  Middleware get verifyJWT;
  Middleware get authorization;
}
