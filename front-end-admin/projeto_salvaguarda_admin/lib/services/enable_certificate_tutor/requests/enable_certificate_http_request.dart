import 'package:http/http.dart' as http;
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/services/getUsers/salvaGuarda_volunteers_model.dart';
import 'package:projeto_salvaguarda_admin/util/custom_env.dart';
import 'package:projeto_salvaguarda_admin/util/extensions/json_parser_extension.dart';

class EnableCertificateHttpRequest {
  static String url = CustomEnv.url;

  static Future<Map<String, dynamic>> requestEnableCertificate(
      SalvaGuardaVolunteers user) async {
    var req = {
      "id": user.id,
    };
    var res =
        await http.patch(Uri.parse("${CustomEnv.url}/user/admin/certificate"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ${AuthService.admToken}',
            },
            body: req.toJson());
    var body = JsonParser.fromJson(res.body);

    return body;
  }
}
