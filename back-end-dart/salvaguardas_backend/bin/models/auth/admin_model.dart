import '../../util/extensions/json_parser_extension.dart';
import '../model_utils.dart';

class AdminModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? cellphone;
  DateTime? dtCreated;
  DateTime? dtUpdated;

  AdminModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.role,
    this.cellphone,
    this.dtCreated,
    this.dtUpdated,
  });

  AdminModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? role,
    String? cellphone,
    DateTime? dtCreated,
    DateTime? dtUpdated,
  }) {
    return AdminModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      cellphone: cellphone ?? this.cellphone,
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
      'cellphone': cellphone,
      'dtCreated': dtCreated?.millisecondsSinceEpoch,
      'dtUpdated': dtUpdated?.millisecondsSinceEpoch,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: ModelUtils.ifNullReturn(map['id'], int.parse),
      name: map['name'],
      email: map['email'],
      cellphone: map['cellphone'],
      role: map['role'] ?? "admin",
      dtCreated: ModelUtils.ifNullReturn(map['dt_create'], DateTime.parse),
      dtUpdated: ModelUtils.ifNullReturn(map['dt_update'], DateTime.parse),
      password: map['password'],
    );
  }

  factory AdminModel.fromJson(String source) =>
      AdminModel.fromMap(JsonParser.fromJson(source));

  String toJson() => toMap().toJson();

  @override
  String toString() {
    return 'AdminModel(id: $id, name: $name, email: $email, password: $password)';
  }
}
