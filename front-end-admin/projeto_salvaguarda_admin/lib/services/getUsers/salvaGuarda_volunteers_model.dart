// import 'dart:async';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
// import 'package:projeto_salvaguarda_admin/util/custom_env.dart';

// Future<List<SalvaGuardaVolunteers>> fetchSalvaGuardaVolunteers() async {
//   final response = await http.get(
//     Uri.parse('${CustomEnv.url}/allUsers'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Bearer ${AuthService.admToken}',
//     },
//   );

//   return (jsonDecode(response.body) as List)
//       .map((userJson) => SalvaGuardaVolunteers.fromJson(userJson))
//       .toList();
// }

class SalvaGuardaVolunteers {
  final int id;
  final String name;
  final String email;
  final String role;
  final String university;
  final String course;
  final int hoursWorked;
  final String cellphone;
  final bool isActive;
  final bool isBanned;
  final DateTime dtCreated;
  final DateTime dtUpdated;

  SalvaGuardaVolunteers(
      {required this.id,
      required this.name,
      required this.email,
      required this.role,
      required this.university,
      required this.course,
      required this.hoursWorked,
      required this.cellphone,
      required this.isActive,
      required this.isBanned,
      required this.dtCreated,
      required this.dtUpdated});

  factory SalvaGuardaVolunteers.fromJson(Map<String, dynamic> json) {
    return SalvaGuardaVolunteers(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      university: json['university'],
      course: json['course'],
      hoursWorked: json['hoursWorked'],
      cellphone: json['cellphone'],
      isActive: json['isActive'],
      isBanned: json['isBanned'],
      dtCreated: DateTime.fromMillisecondsSinceEpoch(json['dtCreated']),
      dtUpdated: DateTime.fromMillisecondsSinceEpoch(json['dtUpdated']),
    );
  }
}
