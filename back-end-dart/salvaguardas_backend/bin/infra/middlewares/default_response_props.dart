import 'package:shelf/shelf.dart';

/// classe que define middleware com propriedades default de toda response
class DefaultResponseProps {
  static Middleware get jsonResponse => createMiddleware(
      // intercepta a response e modifica o mime type no header para devolver json por padrão
      responseHandler: (Response res) =>
          res.change(headers: {'content-type': 'application/json'}));

  static Middleware get cors {
    final headersPermitidos = {'Access-Control-Allow-Origin': '*'};

    Response? handlerOption(Request req) {
      if (req.method == 'OPTIONS') {
        return Response(200, headers: headersPermitidos);
      } else {
        return null;
      }
    }

    Response addCorsHeader(Response res) =>
        res.change(headers: headersPermitidos);

    return createMiddleware(
      requestHandler: handlerOption,
      responseHandler: addCorsHeader,
    );
  }
}
