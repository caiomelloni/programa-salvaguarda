import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../bin/dao/user_dao.dart';
import '../../../bin/errors/auth_exceptions.dart';
import '../../../bin/models/auth/user_model.dart';
import '../../../bin/services/auth/user_service.dart';
import '../../../bin/services/auth/user_service_inteface.dart';
import '../../../bin/transfer_object/auth_to.dart';
import '../../../bin/util/password_hash/password_hash.dart';

class MockUserDAO extends Mock implements UserDAO {}

void main() {
  late UserDAO userDao;
  late IUserService userService;
  late UserModel fakeUser;
  final String nonexistentEmail = "nonexistent@teste.com";
  registerFallbackValue(UserModel());

  setUp(
    () {
      userDao = MockUserDAO();
      userService = UserService(userDao);
      fakeUser = UserModel(
        id: 1,
        email: "teste@teste.com",
        password: PasswordHash().hash("Senha123"),
        hoursWorked: 23,
        isActive: true,
        isBanned: false,
      );

      // call an existing email
      when(() => userDao.findByEmail("teste@teste.com"))
          .thenAnswer((_) async => fakeUser);
      // call an nonexistent email
      when(() => userDao.findByEmail(nonexistentEmail))
          .thenAnswer((_) async => null);

      when(
        () => userDao.updateHoursWorked(1, 37),
      ).thenAnswer((_) async {
        fakeUser.hoursWorked = fakeUser.hoursWorked! + 37;
      });

      when(() => userDao.findOne(1)).thenAnswer((_) async => fakeUser);
    },
  );

  test("should delete user", () async {
    // Arrange
    when(() => userDao.delete(1)).thenAnswer((_) async => fakeUser);
    // Act
    var user = await userService.delete(1);
    // Assert
    expect(user, equals(fakeUser));
  });

  test("should find all users", () async {
    // Arrange
    var userList = [fakeUser];
    when(() => userDao.findAll()).thenAnswer((_) async => userList);
    // Act
    var result = await userService.findAll();
    // Assert
    expect(result, equals(userList));
  });

  test("should find one user", () async {
    // Arrange
    when(() => userDao.findOne(1)).thenAnswer((_) async => fakeUser);
    // Act
    var result = await userService.findOne(1);
    // Assert
    expect(result, equals(fakeUser));
  });

  test("should create a user", () async {
    // Arrange
    when(() => userDao.create(any())).thenAnswer((_) async => UserModel(id: 2));
    // Act
    var result = await userService.save(UserModel(email: nonexistentEmail));
    // Assert
    expect(result.id, equals(2));
  });

  test("should update a user", () async {
    // Arrange
    when(() => userDao.update(fakeUser)).thenAnswer((_) async {
      fakeUser.name = "fake";
      return fakeUser;
    });
    // Act
    var result = await userService.save(fakeUser);
    // Assert
    expect(result.name, equals("fake"));
    fakeUser.name = null;
  });

  test("should avoid create a user with an existing email", () async {
    // Arrange
    // Act
    // Assert
    expect(userService.save(UserModel(email: fakeUser.email)), throwsException);
  });

  test(
    "should throw wrong credential auth exception",
    () {
      // Arrange
      // Act
      // Assert
      expect(userService.authenticate(AuthTo(fakeUser.email!, "Senha1234")),
          throwsA(isA<WrongPasswordAuthException>()));

      expect(userService.authenticate(AuthTo(nonexistentEmail, "Senha123")),
          throwsA(isA<UserNotFoundAuthException>()));
    },
  );

  test("should authenticate", () async {
    expect(
        fakeUser,
        equals(await userService
            .authenticate(AuthTo(fakeUser.email!, "Senha123"))));
  });

  test("should throw disabled user auth exception", () {},
      skip: "feature de desabilitar usuario nao implementada");

  test("should throw banned user auth exception", () {},
      skip: "feature de banir usuario nao implementada");

  test(
    "should update user workload",
    () async {
      int previousHoursWorked = fakeUser.hoursWorked!;
      var result = await userService.updateUserWorkload(1, 37);
      expect(fakeUser, equals(result));
      expect(fakeUser.hoursWorked, equals(previousHoursWorked + 37));
    },
  );
}
