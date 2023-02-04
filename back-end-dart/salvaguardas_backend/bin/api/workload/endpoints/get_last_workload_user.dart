import 'package:shelf/shelf.dart';
import '../../../models/request/request_context.dart';
import '../../../services/workload/workload_service_interface.dart';
import '../../../util/extensions/json_parser_extension.dart';
import '../../endpoint.dart';

class GetLastWorkloadUserEndPoint extends EndPoint {
  final IWorkloadService workloadService;
  GetLastWorkloadUserEndPoint(this.workloadService);
  @override
  Handler get handler => (Request req) async {
        try {
          RequestContext context = RequestContext.fromRequest(req.headers);
          var workload = await workloadService.findLast(context.userID);
          return Response.ok(
              workload?.toMap().toJson() ?? <String, dynamic>{}.toJson());
        } catch (e) {
          return Response.forbidden("Not Authorized");
        }
      };
}
