import 'package:http/http.dart' as http;
import 'package:projeto_salvaguarda_admin/services/auth/errors/auth_exceptions.dart';
import 'package:projeto_salvaguarda_admin/services/auth/models/user_admin.dart';
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/util/custom_env.dart';
import 'package:projeto_salvaguarda_admin/util/extensions/json_parser_extension.dart';

class BanHttpRequest {
  static String url = CustomEnv.url;

  static Future<Map<String, dynamic>> banUserRequest(
      SalvaGuardaVolunteers user) async {
    var req = {
      "id": user.id,
      "isBanned": user.isBanned == false ? 1 : 0,
    };
    var res = await http.patch(Uri.parse("${CustomEnv.url}/user/banUser"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${AuthService.instance.currentUser!.token}',
        },
        body: req.toJson());
    var body = JsonParser.fromJson(res.body);

    return body;
  }
}
