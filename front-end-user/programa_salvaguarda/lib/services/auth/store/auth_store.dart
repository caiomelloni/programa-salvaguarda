import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/services/auth/models/user.dart';
import 'package:programa_salvaguarda/services/auth/repository/auth_stream_repository.dart';

class AuthStore extends ValueNotifier<SalvaGuardasUser?> {
  final UserStream _userStream;
  AuthStore(this._userStream) : super(null) {
    _userStream.onAuthStateChange().listen((event) {
      super.value = event;
      if (super.value == null) {
        //TODO: clear the user local storage data
      }
    });
  }

  SalvaGuardasUser? get currentUser => super.value;

  bool get isLogged => super.value != null;
}
