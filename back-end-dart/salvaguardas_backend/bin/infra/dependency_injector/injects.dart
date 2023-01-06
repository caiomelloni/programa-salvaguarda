import '../../api/auth_api.dart';
import '../../api/user_api.dart';
import '../../api/workload_api.dart';
import '../../services/auth/admin_service.dart';
import '../../services/auth/admin_service_interface.dart';
import '../../services/auth/user_service.dart';
import '../../services/auth/user_service_inteface.dart';
import '../../services/workload/workload_service.dart';
import '../database/dao/admin_dao.dart';
import '../database/dao/user_dao.dart';
import '../database/dao/workload_dao.dart';
import '../database/db_config.dart';
import '../database/mysql_db_config.dart';
import '../security/security_service_imp.dart';
import 'dependency_injector.dart';

class Injects {
  /// init dependencies
  static DependencyInjector initialize() {
    final di = DependencyInjector();

    //database injections
    di.register<DBConfig>(
      () => MySqlDBConfig(),
    );

    di.register<UserDAO>(() => UserDAO(
          di.get<DBConfig>(),
        ));

    di.register<AdminDao>(() => AdminDao(
          di.get<DBConfig>(),
        ));

    di.register<WorkloadDAO>(
      () => WorkloadDAO(
        di.get<DBConfig>(),
      ),
    );

    //service injections
    di.register<SecurityService>(
      () => SecurityService(),
    );

    di.register<IUserService>(
      () => UserService(
        di.get<UserDAO>(),
      ),
    );

    di.register<IAdminService>(
      () => AdminService(
        di.get<AdminDao>(),
      ),
    );

    //api injections
    di.register(
      () => AuthApi(
        di.get<SecurityService>(),
        di.get<IUserService>(),
        di.get<IAdminService>(),
      ),
    );

    di.register(
      () => WorkloadApi(
        WorkLoadService(
          di.get<IUserService>(),
          di.get<WorkloadDAO>(),
        ),
      ),
    );

    di.register(
      () => UserApi(
        di.get<IUserService>(),
      ),
    );

    return di;
  }
}
