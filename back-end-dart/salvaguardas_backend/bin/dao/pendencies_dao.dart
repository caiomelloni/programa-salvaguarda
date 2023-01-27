import '../models/pendencies/pendencies_model.dart';
import 'dao.dart';

class PendenciesDao extends DAO<PendenciesModel> {
  PendenciesDao(super.dbConfig);

  @override
  Future<PendenciesModel> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  //return one pendency based on the id
  @override
  Future<PendenciesModel?> findOne(int id) async {
    var sql = "select * from pendencies where id = :id";
    var result = (await execQuery(sql, {"id": id})).rows;
    return result.isEmpty ? null : PendenciesModel.fromDB(result.first.assoc());
  }

  //create a new pendency to the table of pendencies
  @override
  Future<PendenciesModel> create(PendenciesModel value) async {
    String sql =
        "insert into pendencies (dt_create, dt_update, year, month, pendencies_id_user) values (current_timestamp(), current_timestamp(), :year, :month, :idUser);";
    await execQuery(sql, {
      "year": value.year,
      "month": value.month,
      "idUser": value.pendenciesIdUser,
    });

    return getLastCreated();
  }

  //find all pendencies which are active in the table of pendencies
  @override
  Future<List<PendenciesModel>> findAll() async {
    var sql = "select * from pendencies where pending = :state";
    var q = await execQuery(
      sql,
      {
        "state": true,
      },
    );
    var rows = q.rows;
    List<PendenciesModel> pendencies = [];
    for (var row in rows) {
      pendencies.add(PendenciesModel.fromDB(row.assoc()));
    }
    return pendencies;
  }

  //update a pendency in order to indicate it's resolved
  @override
  Future<PendenciesModel> update(PendenciesModel value) async {
    var sql =
        "update pendencies set pending = 0 where pendencies_id_user = :userId and month = :month and year = :year";

    execQuery(
      sql,
      {
        "userId": value.pendenciesIdUser,
        "month": value.month,
        "year": value.year,
      },
    );

    return (await findByDate(
        value.month, value.year, value.pendenciesIdUser!))!;
  }

  Future<PendenciesModel> getLastCreated() async {
    var sql = "select * from pendencies order by id desc limit 1";
    var db = await connection;
    var result = await db.execute(sql);
    return PendenciesModel.fromDB(result.rows.first.assoc());
  }

  Future<PendenciesModel?> findByDate(int month, int year, int userId) async {
    var sql =
        "select * from pendencies where month = :month and year = :year and pendencies_id_user = :userId";
    var db = await connection;
    var result = (await db
            .execute(sql, {"month": month, "year": year, "userId": userId}))
        .rows;
    return result.isEmpty ? null : PendenciesModel.fromDB(result.first.assoc());
  }
}
