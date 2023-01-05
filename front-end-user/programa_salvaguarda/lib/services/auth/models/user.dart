class SalvaGuardasUser {
  int id;
  String name;
  String lastName;
  String email;
  String cellphone;
  String course;
  String university;
  String role;
  DateTime dtCreated;
  int hoursWorked;
  String token;

  SalvaGuardasUser({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.cellphone,
    required this.course,
    required this.university,
    required this.role,
    required this.dtCreated,
    required this.hoursWorked,
    required this.token,
  });

  SalvaGuardasUser copyWith({
    int? id,
    String? name,
    String? lastName,
    String? email,
    String? cellphone,
    String? course,
    String? university,
    String? role,
    DateTime? dtCreated,
    int? hoursWorked,
    String? token,
  }) {
    return SalvaGuardasUser(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      cellphone: cellphone ?? this.cellphone,
      course: course ?? this.course,
      university: university ?? this.university,
      role: role ?? this.role,
      dtCreated: DateTime.fromMillisecondsSinceEpoch(
          dtCreated?.millisecondsSinceEpoch ??
              this.dtCreated.millisecondsSinceEpoch),
      hoursWorked: hoursWorked ?? this.hoursWorked,
      token: token ?? this.token,
    );
  }

  factory SalvaGuardasUser.fromJson(Map<String, dynamic> json) {
    var user = json['user'];
    String token = json['token'];

    var name = user['name'] as String;
    int firstSpace = (name).indexOf(" ");
    var firstName = (name).substring(0, firstSpace);
    var lastName = (name).substring(firstSpace + 1);

    return SalvaGuardasUser(
      id: user["id"],
      name: firstName,
      lastName: lastName,
      email: user["email"],
      cellphone: user["cellphone"],
      course: user["course"],
      university: user["university"],
      role: user["role"],
      dtCreated: DateTime.fromMillisecondsSinceEpoch(user["dtCreated"]),
      token: token,
      hoursWorked: user["hoursWorked"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['cellphone'] = cellphone;
    data['course'] = course;
    data['university'] = university;
    data['role'] = role;
    data['dtCreated'] = dtCreated;
    data['hoursWorked'] = hoursWorked;
    data['token'] = token;
    return data;
  }

  @override
  String toString() {
    return 'SalvaGuardasUser(id: $id, name: $name, lastName: $lastName, email: $email, cellphone: $cellphone, course: $course, university: $university, role: $role, dtCreated: $dtCreated, hoursWorked: $hoursWorked, token: $token)';
  }
}
