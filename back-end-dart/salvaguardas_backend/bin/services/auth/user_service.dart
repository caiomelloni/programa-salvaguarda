import '../../errors/auth_exceptions.dart';
import '../../dao/user_dao.dart';
import '../../models/auth/user_model.dart';
import '../../transfer_object/auth_to.dart';
import '../../util/password_hash/password_hash.dart';
import 'user_service_inteface.dart';

class UserService implements IUserService {
  final UserDAO _userDao;
  UserService(this._userDao);

  @override
  Future<UserModel> delete(int id) async {
    return _userDao.delete(id);
  }

  @override
  Future<List<UserModel>> findAll() async {
    return _userDao.findAll();
  }

  @override
  Future<UserModel?> findOne(int id) async {
    return _userDao.findOne(id);
  }

  @override

  /// if the user id is null, then creates a new user, but if the email already exists, throws an error
  Future<UserModel> save(UserModel user) async {
    if (user.id == null) {
      var existentUser = await _userDao.findByEmail(user.email!);
      if (existentUser != null) throw EmailAlreadyInUseAuthException();

      return _userDao.create(user);
    } else {
      return _userDao.update(user);
    }
  }

  @override

  ///returns throws auth exception if the credentials are wrong
  Future<UserModel?> authenticate(AuthTo authTo) async {
    var user = await _userDao.findByEmail(authTo.email);

    if (user == null) {
      throw UserNotFoundAuthException();
    }
    if (!PasswordHash().verify(authTo.password, user.password!)) {
      throw WrongPasswordAuthException();
    }
    if (!user.isActive!) {
      throw UserDisabledAuthException();
    }
    if (user.isBanned!) {
      throw UserBannedAuthException();
    }

    return user;
  }

  @override
  Future<UserModel> updateUserWorkload(int id, int workload) async {
    await _userDao.updateHoursWorked(id, workload);
    return _userDao.findOne(id);
  }

  @override
  Future<UserModel?> banUser(UserModel user) async {
    return await _userDao.banUser(user.id!, user.isBanned!);
  }

  @override
  Future<UserModel?> disableUser(UserModel user) async {
    return await _userDao.disableUserById(user.id!);
  }
}
