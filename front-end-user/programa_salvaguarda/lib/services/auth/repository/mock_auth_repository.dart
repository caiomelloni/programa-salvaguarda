import 'dart:async';

import 'package:programa_salvaguarda/services/auth/errors/auth_exceptions.dart';
import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/services/auth/repository/auth_stream_repository.dart';

class MockAuthRepository implements AuthStreamRepository {
  final String _userEmail = "caio_melloni@gmail.com";
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
    String? cellphone,
    String? course,
    String? university,
    String? role,
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
        course == null ||
        university == null ||
        role == null ||
        password == null ||
        passwordConfirmation == null) {
      throw InsufficientInformationAuthException();
    }
    await Future.delayed(const Duration(seconds: 5));
    _emitUser(SalvaGuardasUser(
      id: 1,
      token: "tok",
      name: name,
      lastName: lastName,
      email: email,
      cellphone: cellphone,
      course: course,
      university: university,
      role: role,
      dtCreated: DateTime.now(),
      hoursWorked: 5,
    ));
  }

  @override
  // get in the database the current state of the user
  SalvaGuardasUser? getInitialUserState() => null; // mockUser;

  @override
  Stream<SalvaGuardasUser?> onAuthStateChange() => _streamBroadcast;

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

final mockUser = SalvaGuardasUser(
    id: 1,
    token: "tok",
    course: "Engenharia de Computação",
    email: "caio.melloni@gmail.com",
    hoursWorked: 5,
    name: "Caio",
    lastName: "Melloni dos Santos",
    cellphone: "(11) 4002-8922",
    role: "Mentor",
    dtCreated: DateTime.now(),
    university: "Unicamp");
