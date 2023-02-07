import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/repository/user_spi_repository.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/requests/user_http_requests.dart';

class BackDartUserApi implements UserApiRepository {
  @override
  Future<List<SalvaGuardaVolunteers>> requestGetUsers() async {
    return await UserHttpRequests.fetchSalvaGuardaVolunteers();
  }
}
