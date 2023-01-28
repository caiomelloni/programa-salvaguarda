import '../../models/auth/admin_model.dart';
import '../../transfer_object/auth_to.dart';

abstract class IAdminService {
  Future<AdminModel?> delete(int id);
  Future<List<AdminModel>> findAll();
  Future<AdminModel?> findOne(int id);
  Future<AdminModel> save(AdminModel user);
  ///returns throws auth exception if the credentials are wrong
  Future<AdminModel?> authenticate(AuthTo authTo);
}