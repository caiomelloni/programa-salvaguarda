import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_salvaguarda_admin/services/auth/models/user.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
part 'edit_profile_store.g.dart';

class EditProfileController = _EditProfileController
    with _$EditProfileController;

abstract class _EditProfileController with Store {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController entradaController = TextEditingController();

  late StreamSubscription<SalvaGuardasAdmin?> _listenAuthInfos;
  _EditProfileController() {
    _listenAuthInfos = AuthService.service.onAuthStateChange().listen((user) {
      if (user == null) return;
      _setUserInfosFields(user);
    });

    _setUserInfosFields(AuthService.instance.currentUser!);
  }

  void _setUserInfosFields(SalvaGuardasAdmin user) {
    nomeController.text = user.name;
    sobrenomeController.text = user.lastName;
    emailController.text = user.email;
    telefoneController.text = user.cellphone;
    entradaController.text =
        DateFormat('dd/MM/yyyy').format(user.subscriptionDate).toString();
  }

  void dispose() {
    _listenAuthInfos.cancel();
  }

  @observable
  bool isLoading = false;

  /// atualiza nome, email e telefone
  @action
  Future<void> updateUser() async {
    isLoading = true;
    try {
      await AuthService.service.updateUser(
          nomeController.text,
          sobrenomeController.text,
          emailController.text,
          telefoneController.text);
    } on Exception {
      //TODO: tratar melhor os erros de update do usuário
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
