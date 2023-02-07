import 'package:projeto_salvaguarda_admin/services/getUsers/repository/user_api_repository.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/repository/workload_api_repository.dart';

class WorkloadApiService {
  WorkloadApiService._();
  static final _service = WorkloadApiRepository();
  static WorkloadApiRepository get service => _service;
}
