import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/request/request_context.dart';
import '../services/auth/user_service_inteface.dart';
import '../util/extensions/json_parser_extension.dart';
import 'api.dart';

class UserApi extends Api {
  final IUserService _userService;
  UserApi(
    this._userService,
  );
  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    Router router = Router();

    /// get a user information, a user can get only its on info, admin can get anyone
    router.get("/user", (Request req) async {
      try {
        RequestContext context = RequestContext.fromRequest(req.headers);
        var user = await _userService.findOne(context.userID);
        return Response.ok(
            user?.toJson() ?? {"error": "User Not Found"}.toJson());
      } catch (e) {
        return Response.badRequest();
      }
    });

    /// update a user (name, email or cellphone)
    router.patch("/user", (Request req) async {
      try {
        var body = JsonParser.fromJson(await req.readAsString());
        RequestContext context = RequestContext.fromRequest(req.headers);
        var user = await _userService.findOne(context.userID);
        user = user?.copyWith(
            name: body['name'],
            email: body["email"],
            cellphone: body["cellphone"]);
        user = await _userService.save(user!);
        return Response.ok(user.toJson());
      } catch (e) {
        return Response.badRequest();
      }
    });

    router.get("/allUsers", (Request req) async {
      try {
        RequestContext context = RequestContext.fromRequest(req.headers);
        if (!context.isAdmin) return Response.forbidden("Not Authorized");
        var users = await _userService.findAll();

        return Response.ok(
          users.map((e) => e.toMap()).toList().toJson()
        );
      } catch (e) {
        return Response.badRequest();
      }
    });

    return router;
  }
}
