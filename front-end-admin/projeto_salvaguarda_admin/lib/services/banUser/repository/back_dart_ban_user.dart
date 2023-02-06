import 'package:projeto_salvaguarda_admin/services/banUser/errors/ban_errors.dart';
import 'package:projeto_salvaguarda_admin/services/banUser/repository/ban_repository.dart';
import 'package:projeto_salvaguarda_admin/services/banUser/requests/ban_http_request.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/getUsersFromAPI.dart';

class BackDartBanUser implements BanUserRepository {
  //mudar para requisitar que user seja banido
  @override
  Future<void> RequestBanUser(SalvaGuardaVolunteers user) async {
    var body = await BanHttpRequest.banUserRequest(user);
    //tratar error
  }
}
