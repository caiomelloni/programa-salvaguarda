import 'dart:async';
import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/services/auth/repository/back_dart_auth_repository.dart';
import 'package:programa_salvaguarda/services/auth/repository/mock_auth_repository.dart';

abstract class AuthStreamRepository implements AuthRepository, UserStream {
  factory AuthStreamRepository([bool isTest = false]) {
    if (isTest) return MockAuthRepository();
    return BackDartAuthRepository();
  }
}

/// Makes auth operations, and throws an AuthExpetion on error
abstract class AuthRepository {
  /// fetch the user from the backend, if the token is stored
  Future<void> initService();
  Future<void> signOut();
  Future<void> signIn(String email, String password);
  Future<void> refreshUserState();
  Future<void> signUp(
      String? name,
      String? lastName,
      String? email,
      String? phoneNumber,
      String? course,
      String? university,
      String? role,
      String? senha,
      String? senhaConfimada);
  Future<void> updateUser(
      String name, String lastName, String email, String phoneNumber);
  Stream<SalvaGuardasUser?> onAuthStateChange();
}

abstract class UserStream {
  Stream<SalvaGuardasUser?> onAuthStateChange();

  /// get the current state of the user
}
