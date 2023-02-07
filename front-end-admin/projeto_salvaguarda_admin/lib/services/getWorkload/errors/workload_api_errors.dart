abstract class WorloadApiErrors {
  String errorTitle();
  String message();
}

class CantFetchWorkloadException implements WorloadApiErrors, Exception {
  @override
  String errorTitle() {
    return "Erro! Workload";
  }

  @override
  String message() {
    return "Um erro ocorreu ao realizar esta ação";
  }
}

class NullWorkloadValue implements WorloadApiErrors, Exception {
  @override
  String errorTitle() {
    return "Erro! Workload";
  }

  @override
  String message() {
    return "Não Há Workloads!!!";
  }
}
