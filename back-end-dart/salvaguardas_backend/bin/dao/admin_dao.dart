import 'package:password_dart/password_dart.dart';

import '../models/auth/admin_model.dart';
import 'dao.dart';

class AdminDao extends DAO<AdminModel> {
  AdminDao(super.dbConfig);

  @override
  Future<AdminModel> create(AdminModel value) async {
    var sql =
        'INSERT INTO admins (name, email, role, password) VALUES (:name, :email, :role, :password)';
    await dbConfig.execQuery(
      sql,
      {
        "name": value.name,
        "email": value.email,
        "role": value.role,
        "password": Password.hash(value.password!, PBKDF2()),
      },
    );

    return value;
  }

  @override
  Future<AdminModel> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<AdminModel>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<AdminModel> update(AdminModel value) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<AdminModel> findOne(int id) async {
    var sql = "SELECT * FROM admins WHERE id = :id";
    var q = await dbConfig.execQuery(
      sql,
      {"id": id},
    );
    var rows = q.rows;
    if (rows.isEmpty) throw Exception('[ERROR/DB] -> findOne $id not found.');
    return AdminModel.fromMap(rows.first.assoc());
  }

  Future<AdminModel?> findByEmail(String email) async {
    var sql = "SELECT * FROM admins WHERE email = :email";

    var q = await dbConfig.execQuery(
      sql,
      {"email": email},
    );
    var rows = q.rows;
    if (rows.isEmpty) return null;
    return AdminModel.fromMap(rows.first.assoc());
  }
}
