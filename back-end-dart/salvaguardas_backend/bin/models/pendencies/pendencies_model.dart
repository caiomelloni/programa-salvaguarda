import '../../util/extensions/json_parser_extension.dart';
import '../model_utils.dart';

class PendenciesModel {
  int? id;
  int? pendenciesIdUser;
  int month;
  int year;
  PendenciesModel({
    this.id,
    this.pendenciesIdUser,
    required this.month,
    required this.year,
  });

  PendenciesModel copyWith({
    int? id,
    int? pendenciesIdUser,
    int? month,
    int? year,
  }) {
    return PendenciesModel(
      id: id ?? this.id,
      pendenciesIdUser: pendenciesIdUser ?? this.pendenciesIdUser,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pendencies_id_user': pendenciesIdUser,
      'month': month,
      'year': year,
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
      pendenciesIdUser:
          ModelUtils.ifNullReturn(dbMap['pendencies_id_user'], int.parse),
      month: ModelUtils.ifNullReturn(dbMap['month'], int.parse),
      year: ModelUtils.ifNullReturn(dbMap['year'], int.parse),
    );
  }

  factory PendenciesModel.fromId(Map<String, dynamic> map) {
    return PendenciesModel(
      id: map['id'],
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
