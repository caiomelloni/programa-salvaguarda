import 'package:projeto_salvaguarda_admin/services/getUsers/repository/back_dart_user_api.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/workload_model.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/repository/back_dart_workload_api.dart';

abstract class WorkloadApiRepository {
  factory WorkloadApiRepository() {
    return BackDartWorkloadApi();
  }
  Future<List<WorkloadModel>> requestGetWorkloads(String userId);
}
