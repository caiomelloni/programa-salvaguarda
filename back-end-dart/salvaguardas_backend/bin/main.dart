import 'package:shelf/shelf.dart';
import 'api/auth/auth_api.dart';
import 'api/pendencies_api.dart';
import 'api/user_api.dart';
import 'api/workload/workload_api.dart';
import 'infra/custom_server.dart';
import 'infra/dependency_injector/injects.dart';
import 'infra/middlewares/default_response_props.dart';
import 'util/custom_env.dart';

void main(List<String> arguments) async {
  await CustomEnv.getEnv("dev.env");

  // init dependency injection
  final di = Injects.initialize();

  var cascadeHandler = Cascade()
      .add(
        di.get<AuthApi>().getHandler(isSecurity: false),
      )
      .add(
        di.get<WorkloadApi>().getHandler(),
      )
      .add(
        di.get<UserApi>().getHandler(),
      )
      .add(di.get<PendenciesApi>().getHandler())
      .handler;

  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(DefaultResponseProps.jsonResponse)
      .addMiddleware(DefaultResponseProps.cors)
      .addHandler(cascadeHandler);

  await CustomServer().initialize(handler);
}
