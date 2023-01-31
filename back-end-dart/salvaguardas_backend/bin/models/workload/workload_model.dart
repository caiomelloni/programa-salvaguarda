import '../../util/extensions/json_parser_extension.dart';
import '../model_utils.dart';

class WorkloadModel {
  int? userID;
  int month;
  int year;
  String? description;
  String? feedback;
  int? workedHours;
  WorkloadModel({
    this.userID,
    required this.month,
    required this.year,
    this.description,
    this.feedback,
    this.workedHours,
  });

  WorkloadModel copyWith({
    int? userID,
    int? month,
    int? year,
    String? description,
    String? feedback,
    int? workedHours,
  }) {
    return WorkloadModel(
      userID: userID ?? this.userID,
      month: month ?? this.month,
      year: year ?? this.year,
      description: description ?? this.description,
      feedback: feedback ?? this.feedback,
      workedHours: workedHours ?? this.workedHours,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'month': month,
      'year': year,
      'description': description,
      'feedback': feedback,
      'workedHours': workedHours,
    };
  }

  factory WorkloadModel.fromMap(Map<String, dynamic> map) {
    return WorkloadModel(
      userID: ModelUtils.tryParseToInt(map['userID'].toString()),
      month: DateTime.now().month,
      year: DateTime.now().year,
      description: map['description'],
      feedback: map['feedback'],
      workedHours: ModelUtils.tryParseToInt(map['workedHours'].toString()) ?? 0,
    );
  }

  factory WorkloadModel.fromDB(Map<String, dynamic> dbMap) {
    return WorkloadModel(
      userID: ModelUtils.ifNullReturn(dbMap['id_user'], int.parse),
      month: ModelUtils.ifNullReturn(dbMap['month'], int.parse),
      year: ModelUtils.ifNullReturn(dbMap['year'], int.parse),
      description: dbMap['description'],
      feedback: dbMap['feedback'],
      workedHours:
          ModelUtils.ifNullReturn(dbMap['hours_worked'], int.parse) ?? 0,
    );
  }
  //Check if this is working properly
  factory WorkloadModel.fromAdmUserReq(Map<String, dynamic> dbMap) {
    return WorkloadModel(
      userID: dbMap['id_user'],
      month: DateTime.now().month,
      year: DateTime.now().year,
    );
  }

  factory WorkloadModel.fromJson(String source) =>
      WorkloadModel.fromMap(JsonParser.fromJson(source));

  @override
  String toString() {
    return 'WorkloadModel(userID: $userID, month: $month, year: $year, description: $description, feedback: $feedback, workedHours: $workedHours)';
  }
}
