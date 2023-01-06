import 'dart:convert';
import 'dart:io';

class CustomEnv {
  static late String address;
  static late int port;
  static late String jwtKey;
  static late String dbHost;
  static late int dbPort;
  static late String dbUserName;
  static late String dbPassword;
  static late String dbDatabaseName;

  static Future<void> getEnv(String fileName) async {
    var envFile = await File(fileName).readAsString();
    var data = jsonDecode(envFile);

    address = data['address'];
    port = data['port'];
    jwtKey = data['jwtKey'];
    dbHost = data['dbHost'];
    dbPort = data['dbPort'];
    dbUserName = data['dbUserName'];
    dbPassword = data['dbPassword'];
    dbDatabaseName = data['dbDatabaseName'];
  }
}
