import '../../models/auth/user_model.dart';
import '../../models/workload/workload_model.dart';

abstract class IWorkloadService {
  ///save the workload and returns the user whose workload has been updated
  Future<UserModel?> save(WorkloadModel workload);

  ///get all workload from a user
  Future<List<WorkloadModel>> findAll(int userId);

  Future<WorkloadModel?> findLast(int userId);
}
