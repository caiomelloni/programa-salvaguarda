import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/errors/enable_certiificate_errors.dart';
import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/repository/enable_repository.dart';
import 'package:projeto_salvaguarda_admin/services/enable_certificate_tutor/requests/enable_certificate_http_request.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';

class BackDartEnableCertificateUser implements EnableCertificateRepository {
  //mudar para requisitar que user seja banido
  @override
  Future<void> requestEnableCertificate(SalvaGuardaVolunteers user) async {
    var body =
        await EnableCertificateHttpRequest.requestEnableCertificate(user);
    //tratar erro
  }

  @override
  Future<void> requestEnableAllCertificate() async {
    var body = await EnableCertificateHttpRequest.requestEnableAllCertificate();
    //tratar erro
  }
}
