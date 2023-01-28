
import 'package:shelf/shelf.dart';

import '../../../errors/auth_exceptions.dart';
import '../../../infra/security/security_service_interface.dart';
import '../../../models/auth/user_model.dart';
import '../../../services/auth/user_service_inteface.dart';
import '../../../util/extensions/json_parser_extension.dart';
import '../../endpoint.dart';

class SignUpUserEndPoint extends EndPoint {
  final ISecurityService _securityService;
  final IUserService _userService;
  SignUpUserEndPoint(this._securityService, this._userService);

  @override
  Handler get handler => (Request req) async {
        var body = JsonParser.fromJson(await req.readAsString());

        try {
          var createdUser =
              await _userService.save(UserModel.fromMap(body['user']));
          var jwt = await _securityService.generateJWTUser(createdUser.id!);
          return _noErrorResponse(createdUser, jwt);
        } on AuthException catch (e) {
          return Response.badRequest(
              body: 
            {
              "error": e.message(),
            }.toJson(),
          );
        } catch (e) {
          return Response.badRequest();
        }
      };

  Response _noErrorResponse(UserModel user, String jwt) {
    return Response.ok(
        {
          "user": user.toMap(),
          "token": jwt,
        }.toJson(),
    );
  }
}
