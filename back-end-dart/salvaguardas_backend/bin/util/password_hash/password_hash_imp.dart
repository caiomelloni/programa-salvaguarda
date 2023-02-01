import 'package:password_dart/password_dart.dart';

import 'password_hash.dart';

class PasswordHashImp implements PasswordHash {
  @override
  String hash(String password) {
    return Password.hash(password, PBKDF2());
  }

  @override
  bool verify(String password, String hash) {
    return Password.verify(password, hash);
  }
}
