import 'password_hash_imp.dart';

abstract class PasswordHash {
  ///Checks if the given plain-text [password] matches the given encoded [hash].
  bool verify(String password, String hash);

  ///Hashed the given plain-text [password] using PBKDF2 algorithm.
  String hash(String password);

  factory PasswordHash() => PasswordHashImp();
}
