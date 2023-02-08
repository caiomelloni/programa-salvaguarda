import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/requests/user_http_requests.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/workload_model.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/repository/workload_api_repository.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/requests/workload_http_requests.dart';

class BackDartWorkloadApi implements WorkloadApiRepository {
  @override
  Future<List<WorkloadModel>> requestGetWorkloads(String userId) async {
    return await WorkloadHttpRequests.fetchUserWorkloadModel(userId);
  }
}
