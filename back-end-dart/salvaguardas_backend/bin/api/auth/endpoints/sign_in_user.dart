import 'package:shelf/shelf.dart';
import '../../../errors/auth_exceptions.dart';
import '../../../infra/security/security_service_interface.dart';
import '../../../models/auth/user_model.dart';
import '../../../services/auth/user_service_inteface.dart';
import '../../../transfer_object/auth_to.dart';
import '../../../util/extensions/json_parser_extension.dart';
import '../../endpoint.dart';

class SignInUserEndPoint extends EndPoint {
  final IUserService _userService;
  final ISecurityService _securityService;
  SignInUserEndPoint(this._userService, this._securityService);
  @override
  Handler get handler => (Request req) async {
        var body = await req.readAsString();

        UserModel? user;
        String? jwt;

        try {
          var authTo = AuthTo.fromRequest(body);
          user = await _userService.authenticate(authTo);
          jwt = await _securityService.generateJWTUser(user!.id!);
        } on AuthException catch (e) {
          return Response.forbidden(
            {"error": e.message()}.toJson(),
          );
        } catch (e) {
          return Response.badRequest();
        }

        return _noErrorResponse(user, jwt);
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
