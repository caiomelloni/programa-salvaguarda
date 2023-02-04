import 'dart:convert';

import 'package:programa_salvaguarda/services/auth/service/auth_service.dart';
import 'package:programa_salvaguarda/services/workload/errors/workload_exceptions.dart';
import 'package:programa_salvaguarda/services/workload/models/workload_model.dart';
import 'package:programa_salvaguarda/services/workload/repository/workload_repository.dart';
import 'package:http/http.dart' as http;
import 'package:programa_salvaguarda/util/custom_env.dart';

import '../../../util/extensions/json_parser_extension.dart';

class BackDartWorkloadRepository implements WorkLoadRepository {
  final Future<void> Function() _refreshUser;
  BackDartWorkloadRepository(
    this._refreshUser,
  );

  @override
  Future<void> submitWorkLoad(
      String? workload, String? description, String? feedBack) async {
    var infos = [workload, description, feedBack];
    if (infos.contains("") || infos.contains(null)) {
      throw InsufficientInformationWorkLoadException();
    }

    var req = {
      "userID": AuthService.instance.currentUser?.id,
      "description": description,
      "feedback": feedBack,
      "workedHours": workload
    };
    await http.post(
      Uri.parse("${CustomEnv.url}/workload"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${AuthService.instance.currentUser?.token}',
      },
      body: jsonEncode(req),
    );

    _refreshUser();
  }

  @override
  Future<WorkloadModel?> getLastWorkload() async {
    var res = await http.get(
      Uri.parse("${CustomEnv.url}/workload/last"),
      headers: {
        'Authorization': 'Bearer ${AuthService.instance.currentUser?.token}'
      },
    );

    var body = JsonParser.fromJson(res.body);

    return body.isEmpty ? null : WorkloadModel.fromMap(body);
  }
}
