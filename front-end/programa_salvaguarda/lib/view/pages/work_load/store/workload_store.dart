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
}
