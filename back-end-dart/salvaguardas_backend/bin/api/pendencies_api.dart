import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/pendencies/pendencies_model.dart';
import '../models/request/request_context.dart';
import '../services/pendencies/pendencies_service_interface.dart';
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
      if (pendencies.userID != context.userID) {
        return Response.forbidden(
            'You cant update a pendencies that isnt yours');
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
      late int userId;
      try {
        userId = int.parse(req.params["userId"]!);
      } on Exception {
        return Response.badRequest();
      }

      List<PendenciesModel> pendenciess =
          await _pendenciesService.findAll(userId);

      return Response.ok(jsonEncode(
        pendenciess.map((e) => e.toMap()).toList(),
      ));
    });

    return createHandler(
      route: router,
      middlewares: middlewares,
      isSecurity: isSecurity,
    );
  }
}
