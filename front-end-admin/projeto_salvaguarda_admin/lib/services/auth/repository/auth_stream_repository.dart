import 'dart:async';
import 'package:projeto_salvaguarda_admin/services/auth/models/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/repository/mock_auth_repository.dart';

abstract class AuthStreamRepository implements AuthRepository, UserStream {
  factory AuthStreamRepository([bool isTest = false]) {
    return MockAuthRepository();
  }
}

/// Makes auth operations, and throws an AuthExpetion on error
abstract class AuthRepository {
  Future<void> initService();
  Future<void> signOut();
  Future<void> signIn(String email, String password);
  Future<void> signUp(String? name, String? lastName, String? email,
      String? phoneNumber, String? senha, String? senhaConfimada);
  Future<void> updateUser(
      String? name, String? lastName, String? email, String? phoneNumber);
  Stream<SalvaGuardasUser?> onAuthStateChange();
}

abstract class UserStream {
  Stream<SalvaGuardasUser?> onAuthStateChange();
  // get in the database the current state of the user
  SalvaGuardasUser? getInitialUserState();
}