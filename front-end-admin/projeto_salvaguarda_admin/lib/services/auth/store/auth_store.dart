import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/auth/models/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/repository/auth_stream_repository.dart';

class AuthStore extends ValueNotifier<SalvaGuardasUser?> {
  final UserStream _userStream;
  AuthStore(this._userStream) : super(_userStream.getInitialUserState()) {
    _userStream.onAuthStateChange().listen((event) => super.value = event);
  }

  SalvaGuardasUser? get currentUser => super.value;

  bool get isLogged => super.value != null;
}
