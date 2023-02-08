import 'package:mobx/mobx.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/errors/pendencies_api_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/service/pendencies_api_service.dart';

part 'pendency_api_store.g.dart';

class PendecyApiController = _PendecyApiController with _$PendecyApiController;

abstract class _PendecyApiController with Store {
  @observable
  bool isLoading = false;

  @action
  Future<List<PendenciesModel>?> tryFetchOnePendency(String body) async {
    isLoading = true;
    try {
      return await PendenciesApiService.service.requestOnePendency(body);
    } on CantFetchPendenciesException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<List<PendenciesModel>?> tryFetchPendencies() async {
    isLoading = true;
    try {
      return await PendenciesApiService.service.requestGetAllPendencies();
    } on CantFetchPendenciesException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
