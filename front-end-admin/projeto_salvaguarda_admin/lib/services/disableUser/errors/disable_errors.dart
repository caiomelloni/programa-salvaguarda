abstract class DisableErros {
  String errorTitle();
  String message();
}

class CantDisableException implements DisableErros, Exception {
  @override
  String errorTitle() {
    return "Erro! Desativar";
  }

  @override
  String message() {
    return "Ocorreu um erro ao desativar este usuário";
  }
}
