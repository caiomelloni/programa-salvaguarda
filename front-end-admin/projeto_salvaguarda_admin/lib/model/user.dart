class User {
  int? id;
  final String name;
  final String role;
  final DateTime dtUpdated;
  final String email;
  final String cellphone;
  final String course;
  final int hoursWorked;
  final String university;

  User({
    this.id,
    required this.name,
    required this.role,
    required this.dtUpdated,
    required this.email,
    required this.cellphone,
    required this.course,
    required this.hoursWorked,
    required this.university,
  });

  User copy({
    int? id,
    String? name,
    String? role,
    DateTime? dtUpdated,
    String? email,
    String? cellphone,
    String? course,
    int? hoursWorked,
    String? university,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
        dtUpdated: dtUpdated ?? this.dtUpdated,
        email: email ?? this.email,
        cellphone: cellphone ?? this.cellphone,
        course: course ?? this.course,
        hoursWorked: hoursWorked ?? this.hoursWorked,
        university: university ?? this.university,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          role == other.role &&
          dtUpdated == other.dtUpdated &&
          email == other.email &&
          cellphone == other.cellphone &&
          course == other.course &&
          hoursWorked == other.hoursWorked &&
          university == other.university;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      role.hashCode ^
      dtUpdated.hashCode ^
      email.hashCode ^
      cellphone.hashCode ^
      course.hashCode ^
      hoursWorked.hashCode ^
      university.hashCode;
}
