import 'package:shelf/shelf.dart';

import '../../../errors/auth_exceptions.dart';
import '../../../infra/security/security_service_interface.dart';
import '../../../models/auth/admin_model.dart';
import '../../../services/auth/admin_service_interface.dart';
import '../../../util/extensions/json_parser_extension.dart';
import '../../endpoint.dart';

class SignUpAdminEndpoint extends EndPoint {
  final ISecurityService _securityService;
  final IAdminService _adminService;
  SignUpAdminEndpoint(this._securityService, this._adminService);

  @override
  Handler get handler => (Request req) async {
        var body = JsonParser.fromJson(await req.readAsString());

        try {
          var createdUser =
              await _adminService.save(AdminModel.fromMap(body['admin']));
          var jwt = await _securityService.generateJWTAdmin(createdUser.id!);
          return _noErrorResponse(createdUser, jwt);
        } on AuthException catch (e) {
          return Response.badRequest(
            body: {
              "error": e.message(),
            }.toJson(),
          );
        } catch (e) {
          return Response.badRequest();
        }
      };

  Response _noErrorResponse(AdminModel user, String jwt) {
    return Response.ok(
      {
        "admin": user.toMap(),
        "token": jwt,
      }.toJson(),
    );
  }
}
