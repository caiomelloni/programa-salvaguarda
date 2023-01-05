abstract class BanErros {
  String errorTitle();
  String message();
}

class CantBanUser implements BanErros, Exception {
  @override
  String errorTitle() {
    return "Erro! banimento";
  }

  @override
  String message() {
    return "Ocorreu um erro ao banir este usuário";
  }
}
