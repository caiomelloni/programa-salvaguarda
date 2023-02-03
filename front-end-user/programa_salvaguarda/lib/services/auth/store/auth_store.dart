import 'dart:async';
import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/services/auth/repository/auth_stream_repository.dart';

class AuthStore {
  final UserStream _userStream;
  SalvaGuardasUser? _currentUser;
  AuthStore(this._userStream) {
    _userStream.onAuthStateChange().listen((event) => _currentUser = event);
  }

  SalvaGuardasUser? get currentUser => _currentUser;

  Stream<SalvaGuardasUser?> get userStream => _userStream.onAuthStateChange();
}
