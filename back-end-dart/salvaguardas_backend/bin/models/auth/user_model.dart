import '../../util/extensions/json_parser_extension.dart';
import '../model_utils.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? cellphone;
  String? role;
  String? university;
  String? course;
  int? hoursWorked;
  bool? isActive;
  bool? isBanned;
  DateTime? dtCreated;
  DateTime? dtUpdated;
  String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.cellphone,
    this.role,
    this.university,
    this.course,
    this.hoursWorked,
    this.isActive,
    this.isBanned,
    this.dtCreated,
    this.dtUpdated,
    this.password,
  });

  UserModel.create({
    required this.name,
    required this.email,
    required this.cellphone,
    required this.role,
    required this.university,
    required this.course,
    required this.password,
  });

  UserModel.update({
    required this.id,
    required this.email,
    required this.name,
    required this.cellphone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'university': university,
      'course': course,
      'hoursWorked': hoursWorked,
      'cellphone': cellphone,
      'isActive': isActive,
      'isBanned': isBanned,
      'dtCreated': dtCreated?.millisecondsSinceEpoch,
      'dtUpdated': dtUpdated?.millisecondsSinceEpoch,
    };
  }

  String toJson() => toMap().toJson();

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: ModelUtils.ifNullReturn(map['id'], int.parse),
      name: map['name'],
      email: map['email'],
      role: map['role'],
      university: map['university'],
      cellphone: map['cellphone'],
      course: map['course'],
      hoursWorked: int.parse(map['hours_worked'] ?? '0'),
      password: map['password'],
      isActive: int.parse(map['is_active'] ?? '0') == 1,
      isBanned: int.parse(map['is_banned'] ?? '0') == 1,
      dtCreated: ModelUtils.ifNullReturn(map['dt_create'], DateTime.parse),
      dtUpdated: ModelUtils.ifNullReturn(map['dt_update'], DateTime.parse),
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(JsonParser.fromJson(source));

  factory UserModel.fromUserStateRequest(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      role: map['role'],
      university: map['university'],
      cellphone: map['cellphone'],
      course: map['course'],
      hoursWorked: int.parse(map['hours_worked'] ?? '0'),
      isActive: int.parse(map['is_active'] ?? '0') == 1,
      isBanned: int.parse(map['is_banned'] ?? '0') == 1,
      dtCreated: ModelUtils.ifNullReturn(map['dt_create'], DateTime.parse),
      dtUpdated: ModelUtils.ifNullReturn(map['dt_update'], DateTime.parse),
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, role: $role, university: $university, course: $course, hoursWorked: $hoursWorked, isActive: $isActive, isBanned: $isBanned, dtCreated: $dtCreated, dtUpdated: $dtUpdated)';
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? cellphone,
    String? role,
    String? university,
    String? course,
    int? hoursWorked,
    bool? isActive,
    bool? isBanned,
    DateTime? dtCreated,
    DateTime? dtUpdated,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      cellphone: cellphone ?? this.cellphone,
      role: role ?? this.role,
      university: university ?? this.university,
      course: course ?? this.course,
      hoursWorked: hoursWorked ?? this.hoursWorked,
      isActive: isActive ?? this.isActive,
      isBanned: isBanned ?? this.isBanned,
      dtCreated: dtCreated ?? this.dtCreated,
      dtUpdated: dtUpdated ?? this.dtUpdated,
      password: password ?? this.password,
    );
  }
}
