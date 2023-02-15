import 'package:http/http.dart' as http;
import 'package:projeto_salvaguarda_admin/services/auth/service/auth_service.dart';
import 'package:projeto_salvaguarda_admin/util/custom_env.dart';
import 'package:projeto_salvaguarda_admin/util/extensions/json_parser_extension.dart';

class EnableLatePendencyttpRequest {
  static String url = CustomEnv.url;

  static Future<Map<String, dynamic>> EnableLateUserPendencyRequest(
      int id) async {
    var req = {
      "id": id,
    };
    var res = await http.patch(Uri.parse("${CustomEnv.url}/pendencies/update"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${AuthService.instance.currentUser!.token}',
        },
        body: req.toJson());
    var body = JsonParser.fromJson(res.body);

    return body;
  }
}
