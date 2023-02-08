abstract class PendenciesApiErrors {
  String errorTitle();
  String message();
}

class CantFetchPendenciesException implements PendenciesApiErrors, Exception {
  @override
  String errorTitle() {
    return "Erro! Pendência";
  }

  @override
  String message() {
    return "Um erro ocorreu ao realizar esta ação";
  }
}

class NullPendenciesValue implements PendenciesApiErrors, Exception {
  @override
  String errorTitle() {
    return "Erro! Pendência";
  }

  @override
  String message() {
    return "Não Há Pêndencias!!!";
  }
}
