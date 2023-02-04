import 'package:shelf/shelf.dart';
import '../../../models/request/request_context.dart';
import '../../../services/workload/workload_service_interface.dart';
import '../../../util/extensions/json_parser_extension.dart';
import '../../endpoint.dart';

class GetAllWorkloadsUserEndPoint extends EndPoint {
  final IWorkloadService workloadService;
  GetAllWorkloadsUserEndPoint(this.workloadService);
  @override
  Handler get handler => (Request req) async {
        try {
          RequestContext context = RequestContext.fromRequest(req.headers);
          var workloads = await workloadService.findAll(context.userID);
          var workloadsJson = workloads.map((e) => e.toMap()).toList();
          return Response.ok(workloadsJson.toJson());
        } catch (e) {
          return Response.forbidden("Not Authorized");
        }
      };
}
