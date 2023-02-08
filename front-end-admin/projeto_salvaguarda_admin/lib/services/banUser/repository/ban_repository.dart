import 'package:projeto_salvaguarda_admin/services/banUser/repository/back_dart_ban_user.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';

abstract class BanUserRepository {
  factory BanUserRepository() {
    return BackDartBanUser();
  }

  Future<void> RequestBanUser(SalvaGuardaVolunteers user);
}
