import 'package:projeto_salvaguarda_admin/model/activity.dart';

class User {
  final String name;
  final String role;
  final DateTime dtUpdated;
  final String email;
  final String cellphone;
  final String course;
  final int hoursWorked;
  final String university;
  final List<Activity> listActivities;
  final List<DateTime> pendencies;

  User({
    required this.name,
    required this.role,
    required this.dtUpdated,
    required this.email,
    required this.cellphone,
    required this.course,
    required this.hoursWorked,
    required this.university,
    required this.listActivities,
    required this.pendencies,
  });

  User copy(
          {String? name,
          String? role,
          DateTime? dtUpdated,
          String? email,
          String? cellphone,
          String? course,
          int? hoursWorked,
          String? university,
          List<Activity>? listActivities,
          List<DateTime>? pendencies}) =>
      User(
        name: name ?? this.name,
        role: role ?? this.role,
        dtUpdated: dtUpdated ?? this.dtUpdated,
        email: email ?? this.email,
        cellphone: cellphone ?? this.cellphone,
        course: course ?? this.course,
        hoursWorked: hoursWorked ?? this.hoursWorked,
        university: university ?? this.university,
        listActivities: listActivities ?? this.listActivities,
        pendencies: pendencies ?? this.pendencies,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          role == other.role &&
          dtUpdated == other.dtUpdated &&
          email == other.email &&
          cellphone == other.cellphone &&
          course == other.course &&
          hoursWorked == other.hoursWorked &&
          university == other.university &&
          listActivities == other.listActivities &&
          pendencies == other.pendencies;

  @override
  int get hashCode =>
      name.hashCode ^
      role.hashCode ^
      dtUpdated.hashCode ^
      email.hashCode ^
      cellphone.hashCode ^
      course.hashCode ^
      hoursWorked.hashCode ^
      university.hashCode ^
      listActivities.hashCode ^
      pendencies.hashCode;
}
