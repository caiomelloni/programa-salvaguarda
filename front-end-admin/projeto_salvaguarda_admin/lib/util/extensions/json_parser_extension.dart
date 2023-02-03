import 'dart:convert';

extension JsonParser on Map<String, dynamic> {
  String toJson() => jsonEncode(this);

  static Map<String, dynamic> fromJson(String json) {
    try {
      Map<String, dynamic> jsonMap = jsonDecode(json);
      return jsonMap;
    } on Exception {
      throw Exception("[ERROR JsonParser] => $json cant be converted to json");
    }
  }
}

extension JsonListParser on List<Map<String, dynamic>> {
  String toJson() => jsonEncode(this);
}
