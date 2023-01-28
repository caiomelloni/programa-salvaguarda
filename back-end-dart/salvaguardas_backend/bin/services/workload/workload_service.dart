import '../../dao/workload_dao.dart';
import '../../models/auth/user_model.dart';
import '../../models/workload/workload_model.dart';
import '../auth/user_service_inteface.dart';
import 'workload_service_interface.dart';

class WorkLoadService implements IWorkloadService {
  final IUserService _userService;
  final WorkloadDAO _workloadDao;

  WorkLoadService(this._userService, this._workloadDao);

  @override
  Future<UserModel?> save(WorkloadModel workload) async {
    WorkloadModel? workloadSearch = await _workloadDao.findByDate(
        workload.month, workload.year, workload.userID!);

    late int updatedWorkedHours;
    if (workloadSearch == null) {
      updatedWorkedHours = workload.workedHours!;
      await _workloadDao.create(workload);
    } else {
      updatedWorkedHours = workload.workedHours! - workloadSearch.workedHours!;
      await _workloadDao.update(workload);
    }

    return _userService.updateUserWorkload(
        workload.userID!, updatedWorkedHours);
  }

  @override
  Future<List<WorkloadModel>> findAll(int userId) {
    return _workloadDao.findAllUserWorkload(userId);
  }
}
