import 'package:password_dart/password_dart.dart';

import '../models/auth/admin_model.dart';
import 'dao.dart';

class AdminDao extends DAO<AdminModel> {
  AdminDao(super.dbConfig);

  @override
  Future<AdminModel> create(AdminModel value) async {
    var sql =
        'INSERT INTO admins (name, email, cellphone, password) VALUES (:name, :email, :cellphone, :password)';
    await dbConfig.execQuery(
      sql,
      {
        "name": value.name,
        "email": value.email,
        "cellphone": value.cellphone,
        "password": Password.hash(value.password!, PBKDF2()),
      },
    );

    return _lastUser();
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
  Future<AdminModel> update(AdminModel admin) async {
    var sql =
        "UPDATE admins SET name = :name, email = :email, cellphone = :cellphone  WHERE id = :id";
    await dbConfig.execQuery(
      sql,
      {
        "id": admin.id,
        "name": admin.name,
        "email": admin.email,
        "cellphone": admin.cellphone,
      },
    );

    return findOne(admin.id!);
  }

  @override
  Future<AdminModel> findOne(int id) async {
    var sql = "SELECT * FROM admins WHERE id = :id";
    var rows = await dbConfig.execQuery(
      sql,
      {"id": id},
    );
    if (rows.isEmpty) throw Exception('[ERROR/DB] -> findOne $id not found.');
    return AdminModel.fromMap(rows.first);
  }

  Future<AdminModel?> findByEmail(String email) async {
    var sql = "SELECT * FROM admins WHERE email = :email";

    var rows = await dbConfig.execQuery(
      sql,
      {"email": email},
    );

    if (rows.isEmpty) return null;
    return AdminModel.fromMap(rows.first);
  }

  Future<AdminModel> _lastUser() async {
    var sql = "select * from admins order by id desc limit 1";
    var result = await dbConfig.execQuery(sql);
    return AdminModel.fromMap(result.first);
  }
}
