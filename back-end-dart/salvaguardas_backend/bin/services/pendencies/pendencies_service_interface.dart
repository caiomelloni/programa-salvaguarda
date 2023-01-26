import '../../models/pendencies/pendencies_model.dart';

abstract class IpendenciesService {
  //Delete one pendencie if it is already updated
  Future<PendenciesModel?> delete(int id);
  //return all pendencies
  Future<List<PendenciesModel>> findAll();
  //return one required pendencie
  Future<PendenciesModel?> findOne(int id);
  //create/update one pendencie
  Future<PendenciesModel?> save(PendenciesModel user);
}
