abstract class UserApiErrors {
  String errorTitle();
  String message();
}

class CantFetchUsersException implements UserApiErrors, Exception {
  @override
  String errorTitle() {
    return "Erro! Usuários";
  }

  @override
  String message() {
    return "Um erro ocorreu ao realizar esta ação";
  }
}

class NullUsersValue implements UserApiErrors, Exception {
  @override
  String errorTitle() {
    return "Erro! Usuários";
  }

  @override
  String message() {
    return "Não Há usuários!!!";
  }
}
