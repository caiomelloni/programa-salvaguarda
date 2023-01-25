import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../../errors/auth_exceptions.dart';
import '../../../infra/security/security_service_interface.dart';
import '../../../models/auth/admin_model.dart';
import '../../../models/auth/user_model.dart';
import '../../../services/auth/user_service_inteface.dart';
import '../../endpoint.dart';

class SignUpUserEndPoint extends EndPoint {
  final ISecurityService _securityService;
  final IUserService _userService;
  SignUpUserEndPoint(this._securityService, this._userService);

  @override
  Handler get handler => (Request req) async {
        var body = jsonDecode(await req.readAsString());

        try {
          var createdUser =
              await _userService.save(UserModel.fromMap(body['user']));
          var jwt = await _generateUserJwt(createdUser);
          return _noErrorResponse(createdUser, jwt);
        } on AuthException catch (e) {
          return Response.badRequest(
              body: jsonEncode(
            {
              "error": e.message(),
            },
          ));
        } catch (e) {
          return Response.badRequest();
        }
      };

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
