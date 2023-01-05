import 'package:projeto_salvaguarda_admin/services/banUser/repository/ban_repository.dart';

class BanUserService {
  BanUserService._();
  static final _service = BanUserRepository();
  static BanUserRepository get service => _service;
}
