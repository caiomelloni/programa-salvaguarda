import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/src/handler.dart';
import '../../../errors/auth_exceptions.dart';
import '../../../infra/security/security_service_interface.dart';
import '../../../models/auth/admin_model.dart';
import '../../../services/auth/admin_service_interface.dart';
import '../../../transfer_object/auth_to.dart';
import '../../endpoint.dart';

class SignInAdminEndPoint extends EndPoint {
  final IAdminService _adminService;
  final ISecurityService _securityService;

  SignInAdminEndPoint(this._adminService, this._securityService);

  @override
  Handler get handler => (Request req) async {
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
      };

  Future<String> _generateAdminJwt(AdminModel admin) async {
    return _securityService.generateJWT(admin.id!, true);
  }
}
