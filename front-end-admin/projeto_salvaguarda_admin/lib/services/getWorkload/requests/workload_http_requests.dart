import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/services/getWorkload/workload_model.dart';
import 'package:projeto_salvaguarda_admin/util/custom_env.dart';

class WorkloadHttpRequests {
  static String url = CustomEnv.url;

  static Future<List<WorkloadModel>> fetchUserWorkloadModel(
      String userId) async {
    final response = await http.get(
      Uri.parse('${CustomEnv.url}/workload/admin?userId=$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${AuthService.instance.currentUser!.token}',
      },
    );

    return (jsonDecode(response.body) as List)
        .map((userJson) => WorkloadModel.fromJson(userJson))
        .toList();
  }
}
