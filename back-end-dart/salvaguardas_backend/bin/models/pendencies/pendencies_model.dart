import '../../util/extensions/json_parser_extension.dart';
import '../model_utils.dart';

class PendenciesModel {
  int? id;
  int? pendenciesIdUser;
  int month;
  int year;
  bool? pending;
  DateTime? dtCreate;
  PendenciesModel({
    this.id,
    this.pendenciesIdUser,
    required this.month,
    required this.year,
    this.pending,
    this.dtCreate,
  });

  PendenciesModel copyWith({
    int? id,
    int? pendenciesIdUser,
    int? month,
    int? year,
    bool? pending,
    DateTime? dtCreate,
  }) {
    return PendenciesModel(
      id: id ?? this.id,
      pendenciesIdUser: pendenciesIdUser ?? this.pendenciesIdUser,
      month: month ?? this.month,
      year: year ?? this.year,
      pending: pending ?? this.pending,
      dtCreate: dtCreate ?? this.dtCreate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pendencies_id_user': pendenciesIdUser,
      'month': month,
      'year': year,
      'pending': pending,
      'dt_create': dtCreate?.millisecondsSinceEpoch
    };
  }

  factory PendenciesModel.fromMap(Map<String, dynamic> map) {
    return PendenciesModel(
      pendenciesIdUser:
          ModelUtils.tryParseToInt(map['pendencies_id_user'].toString()),
      month: ModelUtils.tryParseToInt(map['month'])!,
      year: ModelUtils.tryParseToInt(map['year'])!,
    );
  }

  factory PendenciesModel.fromDB(Map<String, dynamic> dbMap) {
    return PendenciesModel(
      id: ModelUtils.ifNullReturn(dbMap['id'], int.parse),
      pendenciesIdUser:
          ModelUtils.ifNullReturn(dbMap['pendencies_id_user'], int.parse),
      month: ModelUtils.ifNullReturn(dbMap['month'], int.parse),
      year: ModelUtils.ifNullReturn(dbMap['year'], int.parse),
      pending: int.parse(dbMap['pending'] ?? '0') == 1,
      dtCreate: ModelUtils.ifNullReturn(dbMap['dt_create'], DateTime.parse),
    );
  }

  factory PendenciesModel.fromId(Map<String, dynamic> map) {
    return PendenciesModel(
      pendenciesIdUser: map['pendencies_id_user'],
      month: DateTime.now().month, //não importa para essa requisição
      year: DateTime.now().year, //não importa para essa requisição
    );
  }

  String toJson() => toMap().toJson();

  factory PendenciesModel.fromJson(String source) =>
      PendenciesModel.fromMap(JsonParser.fromJson(source));

  @override
  String toString() {
    return 'PendenciesModel(pendenciesIdUser: $pendenciesIdUser, month: $month, year: $year';
  }
}
