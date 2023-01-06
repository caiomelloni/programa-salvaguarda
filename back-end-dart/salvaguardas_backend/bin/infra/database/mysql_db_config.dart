import 'package:mysql_client/mysql_client.dart';

import '../../util/custom_env.dart';
import 'db_config.dart';

class MySqlDBConfig implements DBConfig {
  MySQLConnection? _connection;

  @override
  Future<DBConnection> get connection async {
    _connection ??= await createConnection();
    if (_connection == null) {
      throw Exception("[ERROR/DB] -> DB Connection Failed");
    }

    return DBConnection.fromMySQL(
      execute: _connection!.execute,
      close: _connection!.close,
    );
  }

  @override
  Future<MySQLConnection> createConnection() async {
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
}

