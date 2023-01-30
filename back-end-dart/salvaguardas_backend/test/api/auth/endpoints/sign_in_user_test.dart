import 'package:mocktail/mocktail.dart';
import 'package:shelf/shelf.dart';
import 'package:test/test.dart';

import '../../../../bin/dao/user_dao.dart';
import '../../../../bin/api/auth/endpoints/sign_in_user.dart';
import '../../../../bin/errors/auth_exceptions.dart';
import '../../../../bin/infra/security/security_service_imp.dart';
import '../../../../bin/infra/security/security_service_interface.dart';
import '../../../../bin/services/auth/user_service_inteface.dart';
import '../../../../bin/transfer_object/auth_to.dart';
import '../../../../bin/util/extensions/json_parser_extension.dart';

class MockUserDAO extends Mock implements UserDAO {}

class MockUserService extends Mock implements IUserService {}

class MockRequest extends Mock implements Request {}

void main() async {
  late MockUserService userService;
  late ISecurityService securityService;
  late SignInUserEndPoint endpoint;
  late Request req;
  setUp(() {
    req = MockRequest();
    userService = MockUserService();
    securityService = SecurityService();
    endpoint = SignInUserEndPoint(userService, securityService);

    when(() => req.readAsString()).thenAnswer(
        (_) async => '{"email":"user@email.com","password":"Senha1234"}');
    registerFallbackValue(AuthTo("", ""));
  });

  test("should return bad request when body is wrong", () async {
    // Arrange
    when(() => req.readAsString()).thenAnswer((_) async => "{}");

    // Act
    var resp = await endpoint.handler(req);

    // Assert
    expect(resp.statusCode, equals(400));
  });

  test("should return forbidden and error code when the email is wrong",
      () async {
    // Arrange
    when(() => userService.authenticate(any()))
        .thenThrow(UserNotFoundAuthException());

    // Act
    var resp = await endpoint.handler(req);

    // Assert
    expect(resp.statusCode, equals(403));
    var body = JsonParser.fromJson(await resp.readAsString());
    expect(body["error"], isNotNull);
  });

  test("should return forbidden and error code when password is wrong",
      () async {
    // Arrange
    when(() => userService.authenticate(any()))
        .thenThrow(WrongPasswordAuthException());

    // Act
    var resp = await endpoint.handler(req);

    // Assert
    expect(resp.statusCode, equals(403));
    var body = JsonParser.fromJson(await resp.readAsString());
    expect(body["error"], isNotNull);
  });
}
