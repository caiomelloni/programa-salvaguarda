import 'dart:convert';

import '../model_utils.dart';

class PendenciesModel {
  int? userID;
  int month;
  int year;
  PendenciesModel({
    this.userID,
    required this.month,
    required this.year,
  });

  PendenciesModel copyWith({
    int? userID,
    int? month,
    int? year,
  }) {
    return PendenciesModel(
      userID: userID ?? this.userID,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'month': month,
      'year': year,
    };
  }

  factory PendenciesModel.fromMap(Map<String, dynamic> map) {
    return PendenciesModel(
      userID: ModelUtils.tryParseToInt(map['userID'].toString()),
      month: DateTime.now().month,
      year: DateTime.now().year,
    );
  }

  factory PendenciesModel.fromDB(Map<String, dynamic> dbMap) {
    return PendenciesModel(
      userID: ModelUtils.ifNullReturn(dbMap['id_user'], int.parse),
      month: ModelUtils.ifNullReturn(dbMap['month'], int.parse),
      year: ModelUtils.ifNullReturn(dbMap['year'], int.parse),
    );
  }

  String toJson() => json.encode(toMap());

  factory PendenciesModel.fromJson(String source) =>
      PendenciesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PendenciesModel(userID: $userID, month: $month, year: $year';
  }
}
