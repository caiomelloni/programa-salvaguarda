import 'package:password_dart/password_dart.dart';

import '../models/auth/user_model.dart';
import 'dao.dart';

class UserDAO extends DAO<UserModel> {
  UserDAO(super.dbConfig);

  @override
  Future<UserModel> create(UserModel user) async {
    var sql =
        'INSERT INTO users (name, email, role, university, course, cellphone, password) VALUES (:name, :email, :role, :university, :course, :cellphone, :password)';
    await execQuery(
      sql,
      {
        "name": user.name,
        "email": user.email,
        "role": user.role,
        "university": user.university,
        "course": user.course,
        "password": Password.hash(user.password!, PBKDF2()),
        "cellphone": user.cellphone,
      },
    );

    return _lastUser();
  }

  @override
  Future<UserModel> delete(int id) async {
    var sql = 'DELETE FROM users WHERE id = :id';
    var user = await findOne(id);
    await execQuery(sql, {"id": id});
    return user;
  }

  @override
  Future<List<UserModel>> findAll() async {
    var sql = "select * from users";
    var q = await execQuery(sql);
    var t = q.rows.map(
      (row) => UserModel.fromMap(row.assoc()),
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
    var q = await execQuery(
      sql,
      {"id": id},
    );
    var rows = q.rows;
    if (rows.isEmpty) throw Exception('[ERROR/DB] -> findOne $id not found.');
    return UserModel.fromMap(rows.first.assoc());
  }

  @override
  Future<UserModel> update(UserModel user) async {
    var sql =
        "UPDATE users SET name = :name, email = :email, cellphone = :cellphone  WHERE id = :id";
    await execQuery(
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

    await execQuery(
      sql,
      {"hours": user.hoursWorked! + hours, "userID": userId},
    );
  }

  Future<UserModel?> findByEmail(String email) async {
    var sql = "SELECT * FROM users WHERE email = :email";

    var q = await execQuery(
      sql,
      {"email": email},
    );
    var rows = q.rows;
    if (rows.isEmpty) return null;
    return UserModel.fromMap(rows.first.assoc());
  }

  Future<UserModel> _lastUser() async {
    var sql = "select * from users order by id desc limit 1";
    var db = await connection;
    var result = await db.execute(sql);
    return UserModel.fromMap(result.rows.first.assoc());
  }
}
