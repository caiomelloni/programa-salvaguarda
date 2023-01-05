abstract class EnableCertificateErros {
  String errorTitle();
  String message();
}

class CantEnableException implements EnableCertificateErros, Exception {
  @override
  String errorTitle() {
    return "Erro!";
  }

  @override
  String message() {
    return "Ocorreu um erro ao habilitar o cerficado para este usuário este usuário";
  }
}
