import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:programa_salvaguarda/services/auth/errors/auth_exceptions.dart';
import 'package:programa_salvaguarda/services/auth/service/auth_service.dart';
part 'login_store.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  @observable
  bool isLoading = false;

  @action
  Future<void> signIn() async {
    isLoading = true;
    try {
      await AuthService.service
          .signIn(_emailController.text, _passwordController.text);
    } on AuthException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
