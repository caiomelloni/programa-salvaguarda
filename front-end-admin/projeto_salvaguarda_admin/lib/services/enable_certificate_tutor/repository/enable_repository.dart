import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/repository/back_dart_enable_certificate_repository.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';

abstract class EnableCertificateRepository {
  factory EnableCertificateRepository() {
    return BackDartEnableCertificateUser();
  }

  Future<void> requestEnableCertificate(SalvaGuardaVolunteers user);
  Future<void> requestEnableAllCertificate();
}
