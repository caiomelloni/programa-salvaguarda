import 'package:projeto_salvaguarda_admin/services/disableUser/repository/disable_repository.dart';

class DisableUserService {
  DisableUserService._();
  static final _service = DisableUserRepository();
  static DisableUserRepository get service => _service;
}
