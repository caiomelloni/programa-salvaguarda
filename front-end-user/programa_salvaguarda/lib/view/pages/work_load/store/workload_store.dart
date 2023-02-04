import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:programa_salvaguarda/services/workload/errors/workload_exceptions.dart';
import 'package:programa_salvaguarda/services/workload/service/workload_service.dart';

part 'workload_store.g.dart';

class WorkLoadController = _WorkLoadController with _$WorkLoadController;

abstract class _WorkLoadController with Store {
  final TextEditingController cargaHorariaController =
      TextEditingController(text: "");
  final TextEditingController descricaoFeitosController =
      TextEditingController(text: "");
  final TextEditingController feedbackController =
      TextEditingController(text: "");

  Future<void> fetchLastWorkload() async {
    var workload = await WorkLoadService.service.getLastWorkload();

    if (workload != null) {
      cargaHorariaController.text = workload.workedHours.toString();
      descricaoFeitosController.text = workload.description;
      feedbackController.text = workload.feedback;
    }
  }

  @observable
  bool isLoading = false;

  @action
  Future<void> submitWorkLoad() async {
    String cargaHoraria = cargaHorariaController.text;
    String descricaoFeitos = descricaoFeitosController.text;
    String feedback = feedbackController.text;

    isLoading = true;
    try {
      await WorkLoadService.service
          .submitWorkLoad(cargaHoraria, descricaoFeitos, feedback);
    } on WorkLoadException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  String currentMonth() {
    switch (DateTime.now().month) {
      case 1:
        return "Janeiro";
      case 2:
        return "Fevereiro";
      case 3:
        return "Março";
      case 4:
        return "Abril";
      case 5:
        return "Maio";
      case 6:
        return "Junho";
      case 7:
        return "Julho";
      case 8:
        return "Agosto";
      case 9:
        return "Outubro";
      case 10:
        return "Setembro";
      case 11:
        return "Novembro";
      case 12:
        return "Dezembro";
      default:
        return "";
    }
  }
}
