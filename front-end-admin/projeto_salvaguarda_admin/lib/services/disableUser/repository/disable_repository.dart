import 'package:projeto_salvaguarda_admin/services/disableUser/repository/back_dart_disable_user.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/getUsersFromAPI.dart';

abstract class DisableUserRepository {
  factory DisableUserRepository() {
    return BackDartDisableUser();
  }

  // Future<void> RequestBanUser(
  //     //mudar para requisitar a api para banir o usuario
  //     String? workload,
  //     String? description,
  //     String? feedBack);

  Future<void> requestDisableUser(SalvaGuardaVolunteers user);
}
