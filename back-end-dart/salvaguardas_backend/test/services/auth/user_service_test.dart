import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../bin/dao/user_dao.dart';
import '../../../bin/models/auth/user_model.dart';
import '../../../bin/services/auth/user_service.dart';
import '../../../bin/services/auth/user_service_inteface.dart';

class MockUserDAO extends Mock implements UserDAO {}

void main() {
  UserDAO userDao = MockUserDAO();
  IUserService userService = UserService(userDao);
  UserModel fakeUser = UserModel(id: 1, email: "teste@teste.com");
  registerFallbackValue(UserModel());

  // call an existing email
  when(() => userDao.findByEmail("teste@teste.com"))
      .thenAnswer((_) async => fakeUser);
  // call an nonexistent email
  when(() => userDao.findByEmail("nonexistent@teste.com"))
      .thenAnswer((_) async => null);

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
    var result =
        await userService.save(UserModel(email: "nonexistent@teste.com"));
    // Assert
    expect(result.id, equals(2));
  });

  test("should update a user", () async {
    // Arrange
    // Act
    // Assert
  }, skip: "falta implementar a logica do teste");

  test("should avoid create a user with an existing email", () async {
    // Arrange
    // Act
    // Assert
  }, skip: "falta implementar a logica do teste");

  test("should throw wrong credential auth exception", () {},
      skip: "falta implementar a logica do teste");

  test("should throw disabled user auth exception", () {},
      skip: "feature de desabilitar usuario nao implementada");

  test("should throw banned user auth exception", () {},
      skip: "feature de banir usuario nao implementada");
  test("should update user workload", () {},
      skip: "falta implementar a logica do teste");
}
