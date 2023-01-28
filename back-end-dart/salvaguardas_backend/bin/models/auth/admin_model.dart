import '../../util/extensions/json_parser_extension.dart';
import '../model_utils.dart';

class AdminModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? role;
  DateTime? dtCreated;
  DateTime? dtUpdated;

  AdminModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.dtCreated,
    this.dtUpdated,
  });

  AdminModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? role,
    DateTime? dtCreated,
    DateTime? dtUpdated,
  }) {
    return AdminModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      dtCreated: dtCreated ?? this.dtCreated,
      dtUpdated: dtUpdated ?? this.dtUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'dtCreated': dtCreated?.millisecondsSinceEpoch,
      'dtUpdated': dtUpdated?.millisecondsSinceEpoch,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: ModelUtils.ifNullReturn(map['id'], int.parse),
      name: map['name'],
      email: map['email'],
      role: map['role'],
      dtCreated: ModelUtils.ifNullReturn(map['dt_create'], DateTime.parse) ,
      dtUpdated: ModelUtils.ifNullReturn(map['dt_update'], DateTime.parse),
      password: map['password'],
    );
  }

  factory AdminModel.fromJson(String source) =>
      AdminModel.fromMap(JsonParser.fromJson(source));

  @override
  String toString() {
    return 'AdminModel(id: $id, name: $name, email: $email, password: $password)';
  }

}
