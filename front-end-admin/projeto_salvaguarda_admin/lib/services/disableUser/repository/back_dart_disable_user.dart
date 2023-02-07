import 'package:projeto_salvaguarda_admin/services/disableUser/errors/disable_errors.dart';
import 'package:projeto_salvaguarda_admin/services/disableUser/repository/disable_repository.dart';
import 'package:projeto_salvaguarda_admin/services/disableUser/requests/disable_http_request.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/getUsersFromAPI.dart';

class BackDartDisableUser implements DisableUserRepository {
  @override
  Future<void> requestDisableUser(SalvaGuardaVolunteers user) async {
    var body = await DisableHttpRequest.DisableUserRequest(user);
    //tratar error
  }
}
