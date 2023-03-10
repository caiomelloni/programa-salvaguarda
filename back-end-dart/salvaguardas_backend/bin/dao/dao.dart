import '../infra/database/db_config.dart';

///Database Object
abstract class DAO<T> {
  Future<T> create(T value);
  Future<T?> findOne(int id);
  Future<List<T>> findAll();
  Future<T> update(T value);
  Future<T> delete(int id);

  DAO(this.dbConfig);
  final DBConfig dbConfig;

}
