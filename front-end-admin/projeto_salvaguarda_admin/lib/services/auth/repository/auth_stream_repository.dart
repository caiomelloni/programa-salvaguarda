import 'dart:async';
import 'package:projeto_salvaguarda_admin/services/auth/models/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/repository/back_end_auth_repository.dart';
import 'package:projeto_salvaguarda_admin/services/auth/repository/mock_auth_repository.dart';

abstract class AuthStreamRepository implements AuthRepository, UserStream {
  factory AuthStreamRepository([bool isTest = false]) {
    if (isTest) return MockAuthRepository();
    return BackDartAuthRepository();
  }
}

/// Makes auth operations, and throws an AuthExpetion on error
abstract class AuthRepository {
  Future<void> initService();
  Future<void> signOut();
  Future<void> signIn(String email, String password);
  Future<void> refreshUserState();
  Future<void> signUp(String? name, String? lastName, String? email,
      String? phoneNumber, String? senha, String? senhaConfimada);
  Future<void> updateUser(
      String name, String lastName, String email, String phoneNumber);
  Stream<SalvaGuardasAdmin?> onAuthStateChange();
}

abstract class UserStream {
  Stream<SalvaGuardasAdmin?> onAuthStateChange();

  /// get the current state of the user
}
