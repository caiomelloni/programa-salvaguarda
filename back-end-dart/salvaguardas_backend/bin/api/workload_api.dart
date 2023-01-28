import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/auth/user_model.dart';
import '../models/request/request_context.dart';
import '../models/workload/workload_model.dart';
import '../services/workload/workload_service_interface.dart';
import 'api.dart';

class WorkloadApi extends Api {
  final IWorkloadService _workloadService;
  WorkloadApi(this._workloadService);

  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = true,
  }) {
    Router router = Router();

    router.post("/workload", (Request req) async {
      late WorkloadModel workload;

      //verifica se o formato do body é correto
      try {
        workload = WorkloadModel.fromJson(await req.readAsString());
      } on Exception {
        return Response.badRequest();
      }
      RequestContext context = RequestContext(req.context);

      //verificar se o user tenta atualizar um workload com o id dele
      if (workload.userID != context.userID) {
        return Response.forbidden(
            'You cant update an workload that isnt yours');
      }

      UserModel? updatedUser = await _workloadService.save(workload);

      return updatedUser == null
          ? Response.badRequest()
          : Response.ok(updatedUser.toJson());
    });

    ///get all workload registers from a user
    router.get("/workload/admin", (Request req) async {
      RequestContext context = RequestContext(req.context);
      if (!context.isAdmin) return Response.forbidden("Not Authorized");
      late int userId;
      try {
        userId = int.parse(req.params["userId"]!);
      } on Exception {
        return Response.badRequest();
      }

      List<WorkloadModel> workloads = await _workloadService.findAll(userId);

      return Response.ok(jsonEncode(
        workloads.map((e) => e.toMap()).toList(),
      ));
    });

    return createHandler(
      route: router,
      middlewares: middlewares,
      isSecurity: isSecurity,
    );
  }
}
