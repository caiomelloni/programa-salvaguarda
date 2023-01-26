import '../models/workload/workload_model.dart';
import 'dao.dart';

class WorkloadDAO extends DAO<WorkloadModel> {
  WorkloadDAO(super.dbConfig);

  @override
  Future<WorkloadModel> create(WorkloadModel value) {
    String sql =
        "insert into workload (hours_worked, description, feedback, dt_create, dt_update, year, month, id_user) values (:hours, :des, :feed, current_timestamp(), current_timestamp(), :year, :month, :idUser);";
    execQuery(sql, {
      "hours": value.workedHours,
      "des": value.description,
      "feed": value.feedback,
      "year": value.year,
      "month": value.month,
      "idUser": value.userID,
    });

    return getLastCreated();
  }

  @override
  Future<WorkloadModel> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<WorkloadModel>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<WorkloadModel> findOne(int id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  Future<List<WorkloadModel>> findAllUserWorkload(int userId) async {
    var sql = "select * from workload where id_user = :userId";
    var q = await execQuery(sql, {"userId": userId});
    var rows = q.rows;
    List<WorkloadModel> workloads = [];
    for (var row in rows) {
      workloads.add(WorkloadModel.fromDB(row.assoc()));
    }
    return workloads;
  }

  @override
  Future<WorkloadModel> update(WorkloadModel value) async {
    var sql =
        "update workload set hours_worked = :hours, description = :des, feedback = :feed where year = :year and month = :month and id_user = :userId";

    execQuery(
      sql,
      {
        "hours": value.workedHours,
        "des": value.description,
        "feed": value.feedback,
        "year": value.year,
        "month": value.month,
        "userId": value.userID,
      },
    );

    return (await findByDate(value.month, value.year, value.userID!))!;
  }

  Future<WorkloadModel> getLastCreated() async {
    var sql = "select * from workload order by id desc limit 1";
    var db = await connection;
    var result = await db.execute(sql);
    return WorkloadModel.fromDB(result.rows.first.assoc());
  }

  Future<WorkloadModel?> findByDate(int month, int year, int userId) async {
    var sql =
        "select * from workload where month = :month and year = :year and id_user = :userId";
    var db = await connection;
    var result = (await db
            .execute(sql, {"month": month, "year": year, "userId": userId}))
        .rows;
    return result.isEmpty ? null : WorkloadModel.fromDB(result.first.assoc());
  }
}
