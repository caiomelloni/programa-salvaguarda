import 'package:flutter/material.dart';
import 'package:projeto_salvaguarda_admin/services/auth/models/user_admin.dart';
import 'package:projeto_salvaguarda_admin/services/auth/repository/auth_stream_repository.dart';

class AuthStore extends ValueNotifier<SalvaGuardasAdmin?> {
  final UserStream _userStream;
  AuthStore(this._userStream) : super(null) {
    _userStream.onAuthStateChange().listen((event) {
      super.value = event;
      if (super.value == null) {
        //TODO: clear the user local storage data
      }
    });
  }

  SalvaGuardasAdmin? get currentUser => super.value;

  bool get isLogged => super.value != null;
}
