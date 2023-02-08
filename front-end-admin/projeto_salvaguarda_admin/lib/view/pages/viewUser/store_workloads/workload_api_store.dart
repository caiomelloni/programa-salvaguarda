import 'package:mobx/mobx.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/errors/users_api_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/service/users_api_service.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/errors/workload_api_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/repository/workload_api_repository.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/service/workload_api_service.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/workload_model.dart';

part 'workload_api_store.g.dart';

class WorkloadApiController = _WorkloadApiController
    with _$WorkloadApiController;

abstract class _WorkloadApiController with Store {
  @observable
  bool isLoading = false;

  @action
  Future<List<WorkloadModel>?> tryFetchWorkloads(String userId) async {
    isLoading = true;
    try {
      return await WorkloadApiService.service.requestGetWorkloads(userId);
    } on CantFetchWorkloadException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
