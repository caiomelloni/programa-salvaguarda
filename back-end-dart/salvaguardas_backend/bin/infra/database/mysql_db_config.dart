import 'package:mysql_client/mysql_client.dart';

import '../../util/custom_env.dart';
import 'db_config.dart';

class MySqlDBConfig implements DBConfig {
  MySQLConnection? _connectionInstance;

  Future<MySQLConnection> get _connection async {
    _connectionInstance ??= await _createConnection();
    if (_connectionInstance == null) {
      throw Exception("[ERROR/DB] -> DB Connection Failed");
    }

    return _connectionInstance!;
  }

  Future<MySQLConnection> _createConnection() async {
    final db = await MySQLConnection.createConnection(
      host: CustomEnv.dbHost,
      port: CustomEnv.dbPort,
      userName: CustomEnv.dbUserName,
      password: CustomEnv.dbPassword,
      databaseName: CustomEnv.dbDatabaseName,
    );

    await db.connect();
    return db;
  }

  @override
  Future<List<Map<String, String?>>> execQuery(String sql,
      [Map<String, dynamic>? fields]) async {
    var db = await _connection;
    var resultSet = await db.execute(sql, fields);
    List<Map<String, String?>> rows = [];

    for (var rowSet in resultSet.rows) {
      rows.add(rowSet.assoc());
    }
    return rows;
  }
}
