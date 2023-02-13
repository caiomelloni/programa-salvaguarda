import 'package:projeto_salvaguarda_admin/services/enableRegisterPendentWorload/repository/back_dart_enable_late_pendency_user.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';

abstract class EnableRegisterLatePendencyUserRepository {
  factory EnableRegisterLatePendencyUserRepository() {
    return BackDartEnableRegisterLatePendencyUser();
  }

  Future<PendenciesModel?> requestEnableRegisterLatePendencyUser(int id);
}
