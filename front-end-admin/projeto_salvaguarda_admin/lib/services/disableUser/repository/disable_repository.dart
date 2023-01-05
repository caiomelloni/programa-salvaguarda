import 'package:projeto_salvaguarda_admin/services/disableUser/repository/mock_disable_repository.dart';

abstract class DisableUserRepository {
  factory DisableUserRepository() {
    return MockDisableUserRepository();
  }

  // Future<void> RequestBanUser(
  //     //mudar para requisitar a api para banir o usuario
  //     String? workload,
  //     String? description,
  //     String? feedBack);

  Future<void> requestDisableUser(
      //mudar para requisitar a api para banir o usuario -- mudar o estado do usuario para banido
      );
}
