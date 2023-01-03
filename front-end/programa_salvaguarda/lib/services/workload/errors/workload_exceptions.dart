abstract class WorkLoadException {
  String errorTitle();
  String message();
}

class OutOfTimeWorkLoadException implements WorkLoadException, Exception {
  @override
  String errorTitle() {
    return "Fora do prazo";
  }

  @override
  String message() {
    return "A inserção da carga horária só pode ser feita entre os dias 10 e 30 do mês";
  }
}

class InsufficientInformationWorkLoadException implements WorkLoadException, Exception {
  @override
  String errorTitle() {
    return "Informações insuficientes";
  }

  @override
  String message() {
    return "Preencha todos os campos para poder submeter a carga horária";
  }
}
