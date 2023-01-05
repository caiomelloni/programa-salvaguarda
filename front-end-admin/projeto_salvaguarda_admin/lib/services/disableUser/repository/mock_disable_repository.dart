import 'package:projeto_salvaguarda_admin/services/disableUser/errors/disable_errors.dart';
import 'package:projeto_salvaguarda_admin/services/disableUser/repository/disable_repository.dart';

class MockDisableUserRepository implements DisableUserRepository {
  //mudar para requisitar que user seja banido
  @override
  Future<void> requestDisableUser() async {
    // for (var item in [workload, description, feedBack]) {
    //   if ([null, ""].contains(item)) {
    //     throw CantBanUser();
    //   }
    // }

    // await Future.delayed(const Duration(seconds: 3));
    // throw OutOfTimeWorkLoadException();
  }
}
