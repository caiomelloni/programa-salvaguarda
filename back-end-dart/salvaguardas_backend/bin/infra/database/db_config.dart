import 'package:mysql_client/mysql_client.dart';

abstract class DBConfig {
  Future<dynamic> createConnection();
  Future<DBConnection> get connection;
}

class DBConnection {
  Future<IResultSet> Function(String query,
      [Map<String, dynamic>? params, bool iterable]) execute;

  Future<void> Function() close;
  DBConnection.fromMySQL({
    required this.execute,
    required this.close,
  });


}
