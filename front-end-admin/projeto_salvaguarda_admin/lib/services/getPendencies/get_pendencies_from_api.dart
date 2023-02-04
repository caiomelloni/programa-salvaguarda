import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/util/custom_env.dart';

Future<List<PendenciesModel>> fetchPendenciesModel() async {
  final response = await http.get(
    Uri.parse('${CustomEnv.url}/pendencies/admin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${AuthService.admToken}',
    },
  );

  return (jsonDecode(response.body) as List)
      .map((userJson) => PendenciesModel.fromJson(userJson))
      .toList();
}

Future<List<PendenciesModel>> fetchOneUserPendenciesModel(String body) async {
  final response =
      await http.post(Uri.parse('${CustomEnv.url}/pendencies/admin/pendency'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${AuthService.admToken}',
          },
          body: body);

  return (jsonDecode(response.body) as List)
      .map((userJson) => PendenciesModel.fromJson(userJson))
      .toList();
}

class PendenciesModel {
  final int id;
  final int pendenciesIdUser;
  final int month;
  final int year;
  final bool pending;
  final DateTime dtCreated;

  PendenciesModel({
    required this.id,
    required this.pendenciesIdUser,
    required this.month,
    required this.year,
    required this.pending,
    required this.dtCreated,
  });

  factory PendenciesModel.fromJson(Map<String, dynamic> json) {
    return PendenciesModel(
      id: json['id'],
      pendenciesIdUser: json['pendencies_id_user'],
      month: json['month'],
      year: json['year'],
      pending: json['pending'],
      dtCreated: DateTime.fromMillisecondsSinceEpoch(json['dt_create']),
    );
  }
}
