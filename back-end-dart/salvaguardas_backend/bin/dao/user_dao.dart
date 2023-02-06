import '../models/auth/user_model.dart';
import '../util/password_hash/password_hash.dart';
import 'dao.dart';

class UserDAO extends DAO<UserModel> {
  UserDAO(super.dbConfig);

  @override
  Future<UserModel> create(UserModel user) async {
    var sql =
        'INSERT INTO users (name, email, role, university, course, cellphone, password) VALUES (:name, :email, :role, :university, :course, :cellphone, :password)';
    await dbConfig.execQuery(
      sql,
      {
        "name": user.name,
        "email": user.email,
        "role": user.role,
        "university": user.university,
        "course": user.course,
        "password": PasswordHash().hash(user.password!),
        "cellphone": user.cellphone,
      },
    );

    return _lastUser();
  }

  @override
  Future<UserModel> delete(int id) async {
    var sql = 'DELETE FROM users WHERE id = :id';
    var user = await findOne(id);
    await dbConfig.execQuery(sql, {"id": id});
    return user;
  }

  @override
  Future<List<UserModel>> findAll() async {
    var sql = "select * from users";
    var q = await dbConfig.execQuery(sql);
    var t = q.map(
      (row) => UserModel.fromMap(row),
    );
    List<UserModel> results = [];
    for (var elem in t) {
      results.add(elem);
    }
    return results;
  }

  @override
  Future<UserModel> findOne(int id) async {
    var sql = "SELECT * FROM users WHERE id = :id";
    var q = await dbConfig.execQuery(
      sql,
      {"id": id},
    );
    var rows = q;
    if (rows.isEmpty) throw Exception('[ERROR/DB] -> findOne $id not found.');
    return UserModel.fromMap(rows.first);
  }

  @override
  Future<UserModel> update(UserModel user) async {
    var sql =
        "UPDATE users SET name = :name, email = :email, cellphone = :cellphone  WHERE id = :id";
    await dbConfig.execQuery(
      sql,
      {
        "id": user.id,
        "name": user.name,
        "email": user.email,
        "cellphone": user.cellphone,
      },
    );

    return findOne(user.id!);
  }

  Future<void> updateHoursWorked(int userId, int hours) async {
    var sql = "UPDATE users SET hours_worked = :hours WHERE id = :userID";
    UserModel user = await findOne(userId);

    await dbConfig.execQuery(
      sql,
      {"hours": user.hoursWorked! + hours, "userID": userId},
    );
  }

  Future<UserModel?> findByEmail(String email) async {
    var sql = "SELECT * FROM users WHERE email = :email";

    var q = await dbConfig.execQuery(
      sql,
      {"email": email},
    );
    var rows = q;
    if (rows.isEmpty) return null;
    return UserModel.fromMap(rows.first);
  }

  Future<UserModel> _lastUser() async {
    var sql = "select * from users order by id desc limit 1";
    var result = await dbConfig.execQuery(sql);
    return UserModel.fromMap(result.first);
  }

  Future<UserModel> banUser(int id, bool is_banned) {
    var sql = "UPDATE users SET is_banned = :is_banned WHERE id = :id";

    dbConfig.execQuery(
      sql,
      {"id": id, "is_banned": is_banned},
    );

    return findOne(id);
  }

  Future<UserModel> disableUser(int id, bool is_active) {
    var sql = "UPDATE users SET is_active = :is_active WHERE id = :id";

    dbConfig.execQuery(
      sql,
      {"id": id, "is_active": is_active},
    );

    return findOne(id);
  }
}
