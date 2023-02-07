import 'package:projeto_salvaguarda_admin/services/getUsers/repository/back_dart_user_api.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';

abstract class UserApiRepository {
  factory UserApiRepository() {
    return BackDartUserApi();
  }
  Future<List<SalvaGuardaVolunteers>> requestGetUsers();
}
