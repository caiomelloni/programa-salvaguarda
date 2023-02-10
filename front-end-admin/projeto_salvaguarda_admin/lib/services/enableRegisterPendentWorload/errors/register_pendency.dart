abstract class RegisterPendencyError {
  String errorTitle();
  String message();
}

class CantEnableRegisterPendencyException
    implements RegisterPendencyError, Exception {
  @override
  String errorTitle() {
    return "Erro!";
  }

  @override
  String message() {
    return "Ocorreu um erro habilitar o registro desta pendência!";
  }
}
