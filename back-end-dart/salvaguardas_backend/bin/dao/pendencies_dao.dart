import '../models/pendencies/pendencies_model.dart';
import '../models/workload/workload_model.dart';
import 'dao.dart';

class PendenciesDao extends DAO<PendenciesModel> {
  PendenciesDao(super.dbConfig);

  @override
  Future<PendenciesModel> create(PendenciesModel value) {
    String sql =
        "insert into pendencies (dt_create, dt_update, year, month, id_user) values (current_timestamp(), current_timestamp(), :year, :month, :idUser);";
    execQuery(sql, {
      "year": value.year,
      "month": value.month,
      "idUser": value.userID,
    });

    return getLastCreated();
  }

  @override
  Future<PendenciesModel> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<PendenciesModel>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<PendenciesModel> findOne(int id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  Future<List<PendenciesModel>> findAllUserPendencies(int userId) async {
    var sql = "select * from pendencies where id_user = :userId";
    var q = await execQuery(sql, {"userId": userId});
    var rows = q.rows;
    List<PendenciesModel> pendencies = [];
    for (var row in rows) {
      pendencies.add(PendenciesModel.fromDB(row.assoc()));
    }
    return pendencies;
  }

  @override
  Future<PendenciesModel> update(PendenciesModel value) async {
    var sql = "update pendencies set pending = 0 where id_user = :userId";

    execQuery(
      sql,
      {
        "userId": value.userID,
      },
    );

    return (await findByDate(value.month, value.year, value.userID!))!;
  }

  Future<PendenciesModel> getLastCreated() async {
    var sql = "select * from pendencies order by id desc limit 1";
    var db = await connection;
    var result = await db.execute(sql);
    return PendenciesModel.fromDB(result.rows.first.assoc());
  }

  Future<PendenciesModel?> findByDate(int month, int year, int userId) async {
    var sql =
        "select * from pendencies where month = :month and year = :year and id_user = :userId";
    var db = await connection;
    var result = (await db
            .execute(sql, {"month": month, "year": year, "userId": userId}))
        .rows;
    return result.isEmpty ? null : PendenciesModel.fromDB(result.first.assoc());
  }
}
