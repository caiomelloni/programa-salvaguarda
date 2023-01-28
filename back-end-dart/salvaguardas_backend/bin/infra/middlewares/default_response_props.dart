import 'package:shelf/shelf.dart';

/// classe que define middleware com propriedades default de toda response
class DefaultResponseProps {
  Middleware get middleware => createMiddleware(
    // intercepta a response e modifica o mime type no header para devolver json por padrão
    responseHandler: (Response res) => res.change(
      headers: {'content-type' : 'application/json'}
    )
  );
}
