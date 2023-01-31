import '../../models/auth/user_model.dart';
import '../../transfer_object/auth_to.dart';

abstract class IUserService {
  Future<UserModel?> delete(int id);
  Future<List<UserModel>> findAll();
  Future<UserModel?> findOne(int id);
  Future<UserModel> save(UserModel user);
  Future<UserModel?> authenticate(AuthTo authTo);

  /// if workload is negative, it decreases the user workload, if positive it increases
  Future<UserModel?> updateUserWorkload(int id, int workload);
  Future<UserModel?> banUser(UserModel user);
}
