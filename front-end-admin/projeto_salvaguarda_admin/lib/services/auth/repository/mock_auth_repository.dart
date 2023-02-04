import 'dart:async';

import 'package:projeto_salvaguarda_admin/services/auth/errors/auth_exceptions.dart';
import 'package:projeto_salvaguarda_admin/services/auth/models/user_admin.dart';
import 'package:projeto_salvaguarda_admin/services/auth/repository/auth_stream_repository.dart';

class MockAuthRepository implements AuthStreamRepository {
  final String _userEmail = "andre@gmail.com";
  final String _userPassword = "1234567";

  final StreamController<SalvaGuardasAdmin?> _authStreamController =
      StreamController<SalvaGuardasAdmin?>();
  late Stream<SalvaGuardasAdmin?> _streamBroadcast;

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

  void _emitUser(SalvaGuardasAdmin? user) =>
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
    String? cellphone,
    String? password,
    String? passwordConfirmation,
  ) async {
    if (password != passwordConfirmation) {
      throw WrongPasswordConfimationAuthException();
    }
    if (name == null ||
        lastName == null ||
        email == null ||
        cellphone == null ||
        password == null ||
        passwordConfirmation == null) {
      throw InsufficientInformationAuthException();
    }
    await Future.delayed(const Duration(seconds: 5));
    _emitUser(SalvaGuardasAdmin(
      id: 1,
      name: name,
      lastName: lastName,
      email: email,
      cellphone: cellphone,
      subscriptionDate: DateTime.now(),
      token: "tok",
    ));
  }

  @override
  // get in the database the current state of the user
  SalvaGuardasAdmin? getInitialUserState() => null; // mockUser;

  @override
  Stream<SalvaGuardasAdmin?> onAuthStateChange() => _streamBroadcast;

  @override
  Future<void> updateUser(
      String? name, String? lastName, String? email, String? cellphone) async {
    await Future.delayed(const Duration(seconds: 2));
    _emitUser(mockUser.copyWith(
        name: name, lastName: lastName, email: email, cellphone: cellphone));
  }

  @override
  Future<void> refreshUserState() {
    // TODO: implement refreshUserState
    throw UnimplementedError();
  }
}

final mockUser = SalvaGuardasAdmin(
    id: 1,
    email: "andre@gmail.com",
    name: "Andre",
    lastName: "Eidi Maeda",
    cellphone: "(11) 4002-8922",
    subscriptionDate: DateTime.now(),
    token: 'tok');
