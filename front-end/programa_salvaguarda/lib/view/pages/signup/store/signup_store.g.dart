// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on _SignUpController, Store {
  late final _$nomeAtom =
      Atom(name: '_SignUpController.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$sobrenomeAtom =
      Atom(name: '_SignUpController.sobrenome', context: context);

  @override
  String? get sobrenome {
    _$sobrenomeAtom.reportRead();
    return super.sobrenome;
  }

  @override
  set sobrenome(String? value) {
    _$sobrenomeAtom.reportWrite(value, super.sobrenome, () {
      super.sobrenome = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_SignUpController.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_SignUpController.telefone', context: context);

  @override
  String? get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String? value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$universidadeAtom =
      Atom(name: '_SignUpController.universidade', context: context);

  @override
  String? get universidade {
    _$universidadeAtom.reportRead();
    return super.universidade;
  }

  @override
  set universidade(String? value) {
    _$universidadeAtom.reportWrite(value, super.universidade, () {
      super.universidade = value;
    });
  }

  late final _$cursoAtom =
      Atom(name: '_SignUpController.curso', context: context);

  @override
  String? get curso {
    _$cursoAtom.reportRead();
    return super.curso;
  }

  @override
  set curso(String? value) {
    _$cursoAtom.reportWrite(value, super.curso, () {
      super.curso = value;
    });
  }

  late final _$cargoAtom =
      Atom(name: '_SignUpController.cargo', context: context);

  @override
  String? get cargo {
    _$cargoAtom.reportRead();
    return super.cargo;
  }

  @override
  set cargo(String? value) {
    _$cargoAtom.reportWrite(value, super.cargo, () {
      super.cargo = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_SignUpController.senha', context: context);

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$senhaConfirmadaAtom =
      Atom(name: '_SignUpController.senhaConfirmada', context: context);

  @override
  String? get senhaConfirmada {
    _$senhaConfirmadaAtom.reportRead();
    return super.senhaConfirmada;
  }

  @override
  set senhaConfirmada(String? value) {
    _$senhaConfirmadaAtom.reportWrite(value, super.senhaConfirmada, () {
      super.senhaConfirmada = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SignUpController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpController.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$_SignUpControllerActionController =
      ActionController(name: '_SignUpController', context: context);

  @override
  void setNome(String nome) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSobrenome(String sobrenome) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setSobrenome');
    try {
      return super.setSobrenome(sobrenome);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String telefone) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setTelefone');
    try {
      return super.setTelefone(telefone);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUniversidade(String uni) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setUniversidade');
    try {
      return super.setUniversidade(uni);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurso(String curso) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setCurso');
    try {
      return super.setCurso(curso);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCargo(String cargo) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setCargo');
    try {
      return super.setCargo(cargo);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo = _$_SignUpControllerActionController.startAction(
        name: '_SignUpController.setSenha');
    try {
      return super.setSenha(senha);
    } finally {
      _$_SignUpControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
sobrenome: ${sobrenome},
email: ${email},
telefone: ${telefone},
universidade: ${universidade},
curso: ${curso},
cargo: ${cargo},
senha: ${senha},
senhaConfirmada: ${senhaConfirmada},
isLoading: ${isLoading}
    ''';
  }
}
