import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../infra/dependency_injector/dependency_injector.dart';
import '../infra/security/security_service_imp.dart';

abstract class Api {
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  });
  Handler createHandler({
    required Router route,
    List<Middleware>? middlewares,
    required bool isSecurity,
  }) {
    middlewares ??= [];

    if (isSecurity) {
      final security = DependencyInjector().get<SecurityService>();
      middlewares.addAll([
        security.authorization,
        security.verifyJWT,
      ]);
    }

    var pipe = Pipeline();

    for (var mid in middlewares) {
      pipe = pipe.addMiddleware(mid);
    }

    return pipe.addHandler(route);
  }
}
