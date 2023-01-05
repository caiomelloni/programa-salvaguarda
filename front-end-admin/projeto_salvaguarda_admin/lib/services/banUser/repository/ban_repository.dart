import 'package:projeto_salvaguarda_admin/services/banUser/repository/mock_ban_repository.dart';

abstract class BanUserRepository {
  factory BanUserRepository() {
    return MockBanUserRepository();
  }

  // Future<void> RequestBanUser(
  //     //mudar para requisitar a api para banir o usuario
  //     String? workload,
  //     String? description,
  //     String? feedBack);

  Future<void> RequestBanUser(
      //mudar para requisitar a api para banir o usuario -- mudar o estado do usuario para banido
      );
}
