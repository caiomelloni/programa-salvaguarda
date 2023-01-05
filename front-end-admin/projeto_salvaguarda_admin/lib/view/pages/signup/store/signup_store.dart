import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_salvaguarda_admin/services/auth/errors/auth_exceptions.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';

// Include generated file
part 'signup_store.g.dart';

// This is the class used by rest of your codebase
class SignUpController = _SignUpController with _$SignUpController;

// The store-class
abstract class _SignUpController with Store {
  @observable
  String? nome;
  @action
  void setNome(String nome) => this.nome = nome;

  @observable
  String? sobrenome;
  @action
  void setSobrenome(String sobrenome) => this.sobrenome = sobrenome;

  @observable
  String? email;
  @action
  void setEmail(String email) => this.email = email;

  @observable
  String? telefone;
  @action
  void setTelefone(String telefone) => this.telefone = telefone;

  @observable
  String? senha;
  @action
  void setSenha(String senha) => this.senha = senha;

  @observable
  String? senhaConfirmada;
  void setSenhaConfirmada(String senha) => senhaConfirmada = senha;

  @observable
  bool isLoading = false;

  /// returns true if can sign up
  @action
  Future<bool> signUp(BuildContext context) async {
    bool signedUp = false;
    isLoading = true;
    if (nome == null ||
        sobrenome == null ||
        email == null ||
        telefone == null ||
        senha == null ||
        senhaConfirmada == null) {
      showSnackBar(context, "Preencha todos os campo");
      isLoading = false;
      return signedUp;
    }
    try {
      await AuthService.service.signUp(
          nome!, sobrenome!, email!, telefone!, senha!, senhaConfirmada);
      signedUp = true;
    } on AuthException catch (e) {
      showSnackBar(context, e.message());
    }

    if (senha != senhaConfirmada) {
      signedUp = false;
      showSnackBar(context, "senhas não são iguais");
    }

    isLoading = false;

    return signedUp;
  }

  void showSnackBar(BuildContext context, String menssage) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(menssage)));
  }
}
