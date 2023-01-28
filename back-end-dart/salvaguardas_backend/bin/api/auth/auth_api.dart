import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../infra/security/security_service_interface.dart';
import '../../services/auth/admin_service_interface.dart';
import '../../services/auth/user_service_inteface.dart';
import '../api.dart';
import 'endpoints/sign_in_admin.dart';
import 'endpoints/sign_in_user.dart';
import 'endpoints/sign_up_user.dart';

class AuthApi extends Api {
  final ISecurityService _securityService;
  final IUserService _userService;
  final IAdminService _adminService;
  AuthApi(this._securityService, this._userService, this._adminService);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = true,
  }) {
    Router router = Router();

    ///sign up
    router.post(
        '/login', SignUpUserEndPoint(_securityService, _userService).handler);

    ///sign in
    router.post('/login/signin',
        SignInUserEndPoint(_userService, _securityService).handler);

    ///admin sign in
    router.post('/login/admin',
        SignInAdminEndPoint(_adminService, _securityService).handler);

    return createHandler(
      route: router,
      middlewares: middlewares,
      isSecurity: isSecurity,
    );
  }
}
