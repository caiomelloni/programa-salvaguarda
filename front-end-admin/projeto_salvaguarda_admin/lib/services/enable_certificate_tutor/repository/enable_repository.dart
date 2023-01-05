import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/repository/mock_enable_repository.dart';

abstract class EnableCertificateRepository {
  factory EnableCertificateRepository() {
    return MockEnableCertificateRepository();
  }

  // Future<void> RequestBanUser(
  //     //mudar para requisitar a api para banir o usuario
  //     String? workload,
  //     String? description,
  //     String? feedBack);

  Future<void> requestEnableCertificate(
      //mudar para requisitar a api para banir o usuario -- mudar o estado do usuario para banido
      );
}
