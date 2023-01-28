import 'package:password_dart/password_dart.dart';

import '../../errors/auth_exceptions.dart';
import '../../dao/admin_dao.dart';
import '../../models/auth/admin_model.dart';
import '../../transfer_object/auth_to.dart';
import 'admin_service_interface.dart';

class AdminService implements IAdminService {
  final AdminDao _adminDao;
  AdminService(this._adminDao);

  @override
  Future<AdminModel?> authenticate(AuthTo authTo) async {
    var admin = await _adminDao.findByEmail(authTo.email);

    if (admin == null) {
      throw UserNotFoundAuthException();
    }

    if (!Password.verify(authTo.password, admin.password!)) {
      throw WrongPasswordAuthException();
    }
    return admin;
  }

  @override
  Future<AdminModel?> delete(int id) {
    return _adminDao.delete(id);
  }

  @override
  Future<List<AdminModel>> findAll() {
    return _adminDao.findAll();
  }

  @override
  Future<AdminModel?> findOne(int id) {
    return _adminDao.findOne(id);
  }

  @override

  /// if the user id is null, then creates a new user, but if the email already exists, throws an error
  Future<AdminModel> save(AdminModel user) async {
    if (user.id == null) {
      var existentUser = await _adminDao.findByEmail(user.email!);
      if (existentUser != null) throw EmailAlreadyInUseAuthException();

      return _adminDao.create(user);
    } else {
      return _adminDao.update(user);
    }
  }
}
