import 'package:projeto_salvaguarda_admin/services/disableUser/repository/disable_repository.dart';
import 'package:projeto_salvaguarda_admin/services/enableRegisterPendentWorload/repository/late_pendency_repository.dart';

class EnableUserRegisterLatePendencyService {
  EnableUserRegisterLatePendencyService._();
  static final _service = EnableRegisterLatePendencyUserRepository();
  static EnableRegisterLatePendencyUserRepository get service => _service;
}
