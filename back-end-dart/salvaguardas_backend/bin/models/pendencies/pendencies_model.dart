import 'dart:convert';

import '../model_utils.dart';

class PendenciesModel {
  int? userID;
  PendenciesModel({
    this.userID,
  });

  PendenciesModel copyWith({
    int? userID,
  }) {
    return PendenciesModel(
      userID: userID ?? this.userID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
    };
  }

  factory PendenciesModel.fromMap(Map<String, dynamic> map) {
    return PendenciesModel(
      userID: ModelUtils.tryParseToInt(map['userID'].toString()),
    );
  }

  factory PendenciesModel.fromDB(Map<String, dynamic> dbMap) {
    return PendenciesModel(
      userID: ModelUtils.ifNullReturn(dbMap['id_user'], int.parse),
    );
  }

  String toJson() => json.encode(toMap());

  factory PendenciesModel.fromJson(String source) =>
      PendenciesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PendenciesModel(userID: $userID';
  }
}
