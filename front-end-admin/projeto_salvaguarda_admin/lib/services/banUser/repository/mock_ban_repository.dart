import 'package:projeto_salvaguarda_admin/services/banUser/errors/ban_errors.dart';
import 'package:projeto_salvaguarda_admin/services/banUser/repository/ban_repository.dart';

class MockBanUserRepository implements BanUserRepository {
  //mudar para requisitar que user seja banido
  @override
  Future<void> RequestBanUser() async {
    // for (var item in [workload, description, feedBack]) {
    //   if ([null, ""].contains(item)) {
    //     throw CantBanUser();
    //   }
    // }

    // await Future.delayed(const Duration(seconds: 3));
    // throw OutOfTimeWorkLoadException();
  }
}
