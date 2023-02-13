import '../../dao/pendencies_dao.dart';
import '../../models/pendencies/pendencies_model.dart';
import 'pendencies_service_interface.dart';

class PendenciesService implements IpendenciesService {
  final PendenciesDao _pendenciesDAO;

  PendenciesService(this._pendenciesDAO);

  @override
  Future<PendenciesModel?> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PendenciesModel?> findOne(int id) {
    return _pendenciesDAO.findOne(id);
  }

  @override
  Future<List<PendenciesModel>> findAll() {
    return _pendenciesDAO.findAll();
  }

  @override
  Future<PendenciesModel?> save(PendenciesModel pendency) async {
    PendenciesModel? pendencySearch = await _pendenciesDAO.findByDate(
        pendency.month, pendency.year, pendency.pendenciesIdUser!);

    if (pendencySearch == null) {
      return await _pendenciesDAO.create(pendency);
    } else {
      return pendencySearch;
    }
  }

  @override
  Future<List<PendenciesModel>>? findOneByUserIdService(int idUser) {
    return _pendenciesDAO.findOneByUserId(idUser);
  }

  @override
  Future<PendenciesModel?> updatePendency(int id) async {
    return await _pendenciesDAO.updateOnePendncy(id);
  }
}
