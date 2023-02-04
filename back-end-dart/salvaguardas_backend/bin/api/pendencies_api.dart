import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/pendencies/pendencies_model.dart';
import '../models/request/request_context.dart';
import '../services/pendencies/pendencies_service_interface.dart';
import '../util/extensions/json_parser_extension.dart';
import 'api.dart';

class PendenciesApi extends Api {
  final IpendenciesService _pendenciesService;
  PendenciesApi(this._pendenciesService);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = true,
  }) {
    Router router = Router();

    router.post("/pendencies", (Request req) async {
      late PendenciesModel pendencies;

      //verifica se o formato do body é correto
      try {
        pendencies = PendenciesModel.fromJson(await req.readAsString());
      } on Exception {
        return Response.badRequest();
      }
      RequestContext context = RequestContext(req.context);

      //verificar se o user tenta atualizar um pendencies com o id dele
      if (pendencies.pendenciesIdUser != context.userID) {
        return Response.forbidden('You cant update a pendency that isnt yours');
      }

      PendenciesModel? updatePendencie =
          await _pendenciesService.save(pendencies);

      return updatePendencie == null
          ? Response.badRequest()
          : Response.ok(updatePendencie.toJson());
    });

    ///get all pendencies registers from a user
    router.get("/pendencies/admin", (Request req) async {
      RequestContext context = RequestContext(req.context);
      if (!context.isAdmin) return Response.forbidden("Not Authorized");

      List<PendenciesModel> pendencies = await _pendenciesService.findAll();

      return Response.ok(
        pendencies.map((e) => e.toMap()).toList().toJson(),
      );
    });

    ///get one pendency based on id
    router.post("/pendencies/admin/pendency", (Request req) async {
      late PendenciesModel pendency;
      try {
        var r = await req.readAsString();
        pendency = PendenciesModel.fromId(JsonParser.fromJson(r));
      } on Exception {
        return Response.badRequest();
      }
      RequestContext context = RequestContext(req.context);
      if (!context.isAdmin) return Response.forbidden("Not Authorized");

      List<PendenciesModel>? result = await _pendenciesService
          .findOneByUserIdService(pendency.pendenciesIdUser!);

      return result == null
          ? Response.badRequest()
          : Response.ok(
              result.map((e) => e.toMap()).toList().toJson(),
            );
    });

    return createHandler(
      route: router,
      middlewares: middlewares,
      isSecurity: isSecurity,
    );
  }
}
