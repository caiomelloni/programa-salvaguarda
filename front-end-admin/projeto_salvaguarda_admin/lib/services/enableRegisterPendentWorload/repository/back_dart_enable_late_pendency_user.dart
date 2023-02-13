import 'package:projeto_salvaguarda_admin/services/disableUser/requests/disable_http_request.dart';
import 'package:projeto_salvaguarda_admin/services/enableRegisterPendentWorload/repository/late_pendency_repository.dart';
import 'package:projeto_salvaguarda_admin/services/enableRegisterPendentWorload/requests/enable_late_pendency_http_request.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';

class BackDartEnableRegisterLatePendencyUser
    implements EnableRegisterLatePendencyUserRepository {
  @override
  Future<PendenciesModel?> requestEnableRegisterLatePendencyUser(int id) async {
    var body =
        await EnableLatePendencyttpRequest.EnableLateUserPendencyRequest(id);
    //tratar error
  }
}
