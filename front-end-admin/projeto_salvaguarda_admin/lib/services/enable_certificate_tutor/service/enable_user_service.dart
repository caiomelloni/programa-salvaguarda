import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/repository/enable_repository.dart';

class EnableCertificateService {
  EnableCertificateService._();
  static final _service = EnableCertificateRepository();
  static EnableCertificateRepository get service => _service;
}
