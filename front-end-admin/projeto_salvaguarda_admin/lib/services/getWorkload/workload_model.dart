// import 'dart:async';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
// import 'package:projeto_salvaguarda_admin/util/custom_env.dart';

// Future<List<WorkloadModel>> fetchUserWorkloadModel(String userId) async {
//   final response = await http.get(
//     Uri.parse('${CustomEnv.url}/workload/admin?userId=$userId'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Bearer ${AuthService.admToken}',
//     },
//   );

//   return (jsonDecode(response.body) as List)
//       .map((userJson) => WorkloadModel.fromJson(userJson))
//       .toList();
// }

class WorkloadModel {
  final int userID;
  final int month;
  final int year;
  final String description;
  final String feedback;
  final int workedHours;

  WorkloadModel({
    required this.userID,
    required this.month,
    required this.year,
    required this.description,
    required this.feedback,
    required this.workedHours,
  });

  factory WorkloadModel.fromJson(Map<String, dynamic> json) {
    return WorkloadModel(
      userID: json['userID'],
      month: json['month'],
      year: json['year'],
      description: json['description'],
      feedback: json['feedback'],
      workedHours: json['workedHours'],
    );
  }
}
