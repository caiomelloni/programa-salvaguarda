import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/errors/enable_certiificate_errors.dart';
import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/repository/enable_repository.dart';

class MockEnableCertificateRepository implements EnableCertificateRepository {
  //mudar para requisitar que user seja banido
  @override
  Future<void> requestEnableCertificate() async {
    // for (var item in [workload, description, feedBack]) {
    //   if ([null, ""].contains(item)) {
    //     throw CantBanUser();
    //   }
    // }

    // await Future.delayed(const Duration(seconds: 3));
    // throw OutOfTimeWorkLoadException();
  }
}
