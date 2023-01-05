import 'package:programa_salvaguarda/services/auth/service/auth_service.dart';
import 'package:programa_salvaguarda/services/workload/repository/workload_repository.dart';

class WorkLoadService {
  WorkLoadService._();
  static late WorkLoadRepository _service;
  static void initWorkloadService() {
    _service = WorkLoadRepository(AuthService.service.refreshUserState);
  }

  static WorkLoadRepository get service => _service;
}
