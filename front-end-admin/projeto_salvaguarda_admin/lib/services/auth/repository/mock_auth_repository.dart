import 'dart:async';

import 'package:projeto_salvaguarda_admin/services/auth/errors/auth_exceptions.dart';
import 'package:projeto_salvaguarda_admin/services/auth/models/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/repository/auth_stream_repository.dart';

class MockAuthRepository implements AuthStreamRepository {
  final String _userEmail = "andre@gmail.com";
  final String _userPassword = "1234567";
 

  final StreamController<SalvaGuardasUser?> _authStreamController =
      StreamController<SalvaGuardasUser?>();
  late Stream<SalvaGuardasUser?> _streamBroadcast;

  MockAuthRepository() {
    _streamBroadcast = _authStreamController.stream.asBroadcastStream();
  }

  @override
  Future<void> initService() async {
    print("initializing auth service");
    await Future.delayed(const Duration(seconds: 5));
    _emitUser(mockUser);
    print("service initialized");
  }

  void _emitUser(SalvaGuardasUser? user) =>
      _authStreamController.sink.add(user);

  @override
  Future<void> signOut() async => _emitUser(null);

  @override
  Future<void> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email != _userEmail) throw UserNotFoundAuthException();
    if (password != _userPassword) throw WrongPasswordAuthException();

    _emitUser(mockUser.copyWith(email: email));
  }

  @override
  Future<void> signUp(
    String? name,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? passwordConfirmation,
  ) async {
    if (password != passwordConfirmation) {
      throw WrongPasswordConfimationAuthException();
    }
    if (name == null ||
        lastName == null ||
        email == null ||
        phoneNumber == null ||
        password == null ||
        passwordConfirmation == null) {
      throw InsufficientInformationAuthException();
    }
    await Future.delayed(const Duration(seconds: 5));
    _emitUser(SalvaGuardasUser(
      name: name,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      subscriptionDate: "17/04/2000",
    ));
  }

  @override
  // get in the database the current state of the user
  SalvaGuardasUser? getInitialUserState() => null; // mockUser;

  @override
  Stream<SalvaGuardasUser?> onAuthStateChange() => _streamBroadcast;

  @override
  Future<void> updateUser(String? name, String? lastName, String? email,
      String? phoneNumber) async {
    await Future.delayed(const Duration(seconds: 2));
    _emitUser(mockUser.copyWith(
        name: name,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber));
  }
}

final mockUser = SalvaGuardasUser(
  email: "andre@gmail.com",
  name: "Andre",
  lastName: "Eidi Maeda",
  phoneNumber: "(11) 4002-8922",
  subscriptionDate: "14/11/22",
);
