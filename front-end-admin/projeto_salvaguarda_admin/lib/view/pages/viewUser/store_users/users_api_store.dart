import 'package:mobx/mobx.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/errors/users_api_errors.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/service/users_api_service.dart';

part 'users_api_store.g.dart';

class UserApiController = _UserApiController with _$UserApiController;

abstract class _UserApiController with Store {
  @observable
  bool isLoading = false;

  @action
  Future<List<SalvaGuardaVolunteers>?> tryFetchUsers() async {
    isLoading = true;
    try {
      return await UsersApiService.service.requestGetUsers();
    } on CantFetchUsersException {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
