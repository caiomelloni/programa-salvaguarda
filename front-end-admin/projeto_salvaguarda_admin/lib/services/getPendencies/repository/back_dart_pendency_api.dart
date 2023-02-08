import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/repository/pendency_api_repository.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/requests/pendencies_http_requests.dart';

class BackDartPendencyApi implements PendecyApiRepository {
  // @override
  // Future<List<SalvaGuardaVolunteers>> requestGetUsers() async {
  //   return await UserHttpRequests.fetchSalvaGuardaVolunteers();
  // }

  @override
  Future<List<PendenciesModel>> requestGetAllPendencies() async {
    return await PendencyHttpRequests.fetchPendenciesModel();
  }

  @override
  Future<List<PendenciesModel>> requestOnePendency(String body) async {
    return await PendencyHttpRequests.fetchOneUserPendenciesModel(body);
  }
}
