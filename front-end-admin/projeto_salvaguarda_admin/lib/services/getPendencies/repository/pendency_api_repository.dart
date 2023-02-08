import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/repository/back_dart_pendency_api.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';

abstract class PendecyApiRepository {
  factory PendecyApiRepository() {
    return BackDartPendencyApi();
  }
  Future<List<PendenciesModel>> requestGetAllPendencies();
  Future<List<PendenciesModel>> requestOnePendency(String body);
}
