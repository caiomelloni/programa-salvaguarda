import 'package:projeto_salvaguarda_admin/services/getPendencies/repository/pendency_api_repository.dart';

class PendenciesApiService {
  PendenciesApiService._();
  static final _service = PendecyApiRepository();
  static PendecyApiRepository get service => _service;
}
