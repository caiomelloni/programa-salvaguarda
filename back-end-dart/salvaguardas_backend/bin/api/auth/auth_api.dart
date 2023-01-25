import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../errors/auth_exceptions.dart';
import '../../infra/security/security_service_interface.dart';
import '../../models/auth/admin_model.dart';
import '../../models/auth/user_model.dart';
import '../../services/auth/admin_service_interface.dart';
import '../../services/auth/user_service_inteface.dart';
import '../../transfer_object/auth_to.dart';
import '../api.dart';
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
    router.post('/login', SignUpUserEndPoint(_securityService, _userService).handler);

    ///sign in
    router.post('/login/signin', SignInUserEndPoint(_userService, _securityService).handler);

    ///admin sign in
    router.post('/login/admin', (Request req) async {
      var body = await req.readAsString();

      AdminModel? admin;
      String? jwt;

      try {
        var authTo = AuthTo.fromRequest(body);
        admin = await _adminService.authenticate(authTo);
        jwt = await _generateAdminJwt(admin!);
      } on AuthException catch (e) {
        return Response.forbidden(
          jsonEncode(
            {"error": e.message()},
          ),
        );
      } on Exception {
        return Response.badRequest();
      }

      return Response.ok(
        jsonEncode(
          {
            "admin": admin.toMap(),
            "token": jwt,
          },
        ),
      );
    });

    return createHandler(
      route: router,
      middlewares: middlewares,
      isSecurity: isSecurity,
    );
  }

  Future<String> _generateUserJwt(UserModel user) async {
    return _securityService.generateJWT(user.id!, false);
  }

  Future<String> _generateAdminJwt(AdminModel admin) async {
    return _securityService.generateJWT(admin.id!, true);
  }

  Response _noErrorResponse(UserModel user, String jwt) {
    return Response.ok(
      jsonEncode(
        {
          "user": user.toMap(),
          "token": jwt,
        },
      ),
    );
  }
}
