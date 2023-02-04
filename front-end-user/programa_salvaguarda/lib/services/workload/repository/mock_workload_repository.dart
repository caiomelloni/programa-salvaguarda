import 'package:programa_salvaguarda/services/workload/errors/workload_exceptions.dart';
import 'package:programa_salvaguarda/services/workload/models/workload_model.dart';
import 'package:programa_salvaguarda/services/workload/repository/workload_repository.dart';

class MockWorkLoadRepository implements WorkLoadRepository {
  @override
  Future<void> submitWorkLoad(
      String? workload, String? description, String? feedBack) async {
    for (var item in [workload, description, feedBack]) {
      if ([null, ""].contains(item)) {
        throw InsufficientInformationWorkLoadException();
      }
    }

    await Future.delayed(const Duration(seconds: 3));
    // throw OutOfTimeWorkLoadException();
  }

  @override
  Future<WorkloadModel> getLastWorkload() {
    // TODO: implement getLastWorkload
    throw UnimplementedError();
  }
  
  @override
  Future<List<WorkloadModel>> getAllWorkloads() {
    // TODO: implement getAllWorkloads
    throw UnimplementedError();
  }
}
