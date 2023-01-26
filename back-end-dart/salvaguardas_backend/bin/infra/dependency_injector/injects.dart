import '../../api/auth/auth_api.dart';
import '../../api/pendencies_api.dart';
import '../../api/user_api.dart';
import '../../api/workload_api.dart';
import '../../dao/pendencies_dao.dart';
import '../../services/auth/admin_service.dart';
import '../../services/auth/admin_service_interface.dart';
import '../../services/auth/user_service.dart';
import '../../services/auth/user_service_inteface.dart';
import '../../services/pendencies/pendencies_service.dart';
import '../../services/pendencies/pendencies_service_interface.dart';
import '../../services/workload/workload_service.dart';
import '../../dao/admin_dao.dart';
import '../../dao/user_dao.dart';
import '../../dao/workload_dao.dart';
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

    di.register<PendenciesDao>(() => PendenciesDao(
          di.get<DBConfig>(),
        ));

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
    di.register<PendenciesApi>(
        () => PendenciesApi(PendenciesService(di.get<PendenciesDao>())));

    return di;
  }
}
