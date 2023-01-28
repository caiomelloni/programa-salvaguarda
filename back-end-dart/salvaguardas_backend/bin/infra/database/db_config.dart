import 'package:mysql_client/mysql_client.dart';

abstract class DBConfig {

  ///Executes a database operation. Returns a list of rows, each row is a Map
  Future<List<Map<String, String?>>> execQuery(String databaseCommand,
      [Map<String, dynamic>? fields]);
}

