import 'package:shelf/shelf.dart';
import '../../util/custom_env.dart';
import 'security_service_interface.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class SecurityService implements ISecurityService<JWT> {
  @override
  Future<String> generateJWT(int userID, bool isAdmin) async {
    var jwt = JWT(
      {
        'iat': DateTime.now().millisecondsSinceEpoch,
        'userID': userID,
        'isAdmin': isAdmin,
      },
    );

    String key = CustomEnv.jwtKey;
    String token = jwt.sign(SecretKey(key));

    return token;
  }

  @override
  JWT? validateJWT(String token) {
    String key = CustomEnv.jwtKey;

    try {
      return JWT.verify(token, SecretKey(key));
    } on JWTInvalidError {
      return null;
    } on JWTNotActiveError {
      return null;
    } on JWTUndefinedError {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  //TODO: fix the context, the context is being passed as null inside the api layer
  Middleware get authorization {
    return (Handler handler) {
      return (Request req) {
        var authorizationHeader = req.headers["Authorization"];
        JWT? jwt;
        if (authorizationHeader != null) {
          if (authorizationHeader.startsWith("Bearer ")) {
            String token = authorizationHeader.substring(7);
            jwt = validateJWT(token);
          }
        }
        var payload = jwt?.payload;
        var request = req.change(context: {
          'jwt': jwt,
          'userID': payload != null ? payload['userID'] : null,
          'isAdmin': payload != null ? payload['isAdmin'] : null,
        });
        return handler(request);
      };
    };
  }

  @override
  Middleware get verifyJWT => createMiddleware(requestHandler: (Request req) {
        print(req.context['jwt']);
        if (req.context['jwt'] == null) {
          return Response.forbidden('Not Authorized');
        }
        return null;
      });
}
