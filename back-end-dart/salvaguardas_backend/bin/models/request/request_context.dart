import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import '../../infra/security/security_service_imp.dart';

class RequestContext {
  Map<String, Object> _context;
  late int userID;
  late bool isAdmin;
  RequestContext(
    this._context,
  ) {
    userID = _context['userID'] as int;
    isAdmin = _context['isAdmin'] as bool;
  }

  factory RequestContext.fromRequest(Map<String, String> headers) {
    var authorizationHeader = headers["Authorization"];
    JWT? jwt;
    if (authorizationHeader != null) {
      if (authorizationHeader.startsWith("Bearer ")) {
        String token = authorizationHeader.substring(7);
        jwt = SecurityService().validateJWT(token);
      }
    }
    var payload = jwt?.payload;
    var context = <String, Object>{
      'userID': payload != null ? payload['userID'] : null,
      'isAdmin': payload != null ? payload['isAdmin'] : null,
    };
    return RequestContext(context);
  }

  @override
  String toString() {
    return 'RequestContext(_context: $_context, userID: $userID, isAdmin: $isAdmin)';
  }
}
