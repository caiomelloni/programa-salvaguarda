import 'package:programa_salvaguarda/services/workload/repository/back_dart_workload_repository.dart';
import 'package:programa_salvaguarda/services/workload/repository/mock_workload_repository.dart';

import '../models/workload_model.dart';

abstract class WorkLoadRepository {
  factory WorkLoadRepository(Future<void> Function() refreshUser,
      [isTest = false]) {
    if (isTest) {
      return MockWorkLoadRepository();
    }
    return BackDartWorkloadRepository(refreshUser);
  }

  Future<void> submitWorkLoad(
      String? workload, String? description, String? feedBack);

  Future<WorkloadModel?> getLastWorkload();

  Future<List<WorkloadModel>> getAllWorkloads();
}
