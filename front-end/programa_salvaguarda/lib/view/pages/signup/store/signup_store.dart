import 'package:mobx/mobx.dart';
import 'package:programa_salvaguarda/services/auth/errors/auth_exceptions.dart';
import 'package:programa_salvaguarda/services/auth/service/auth_service.dart';

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
  String? universidade;
  @action
  void setUniversidade(String uni) {
    universidade = uni;
  }

  @observable
  String? curso;
  @action
  void setCurso(String curso) => this.curso = curso;

  @observable
  String? cargo;

  @action
  void setCargo(String cargo) => this.cargo = cargo;

  @observable
  String? senha;
  @action
  void setSenha(String senha) => this.senha = senha;

  @observable
  String? senhaConfirmada;
  void setSenhaConfirmada(String senha) => senhaConfirmada = senha;

  @observable
  bool isLoading = false;

  @action
  Future<void> signUp() async {
    isLoading = true;
    try {
      await AuthService.service.signUp(nome, sobrenome, email, telefone, curso,
          universidade, cargo, senha, senhaConfirmada);
    } on AuthException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
