import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/services/getPendencies/pendencies_model.dart';
import 'package:projeto_salvaguarda_admin/util/custom_env.dart';

class PendencyHttpRequests {
  static Future<List<PendenciesModel>> fetchPendenciesModel() async {
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

  static Future<List<PendenciesModel>> fetchOneUserPendenciesModel(
      String body) async {
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
}
