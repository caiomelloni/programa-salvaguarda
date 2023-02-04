import 'package:programa_salvaguarda/util/extensions/json_parser_extension.dart';

/*
example of a workload json
{
    "userID": 6,
    "month": 2,
    "year": 2023,
    "description": "aaaaa",
    "feedback": "aaaaaa",
    "workedHours": 5
}
*/
class WorkloadModel {
  int userID;
  int month;
  int year;
  String description;
  String feedback;
  int workedHours;
  WorkloadModel({
    required this.userID,
    required this.month,
    required this.year,
    required this.description,
    required this.feedback,
    required this.workedHours,
  });

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
      userID: map['userID']?.toInt() ?? 0,
      month: map['month']?.toInt() ?? 0,
      year: map['year']?.toInt() ?? 0,
      description: map['description'] ?? '',
      feedback: map['feedback'] ?? '',
      workedHours: map['workedHours']?.toInt() ?? 0,
    );
  }

  String toJson() => toMap().toJson();

  factory WorkloadModel.fromJson(String source) => WorkloadModel.fromMap(JsonParser.fromJson(source));
}
