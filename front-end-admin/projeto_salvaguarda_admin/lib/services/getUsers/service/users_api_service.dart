import 'package:projeto_salvaguarda_admin/services/getUsers/repository/user_spi_repository.dart';

class UsersApiService {
  UsersApiService._();
  static final _service = UserApiRepository();
  static UserApiRepository get service => _service;
}
