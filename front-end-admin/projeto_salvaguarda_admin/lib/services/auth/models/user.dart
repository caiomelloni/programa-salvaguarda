import 'package:flutter/scheduler.dart';

class SalvaGuardasAdmin {
  int id;
  String name;
  String lastName;
  String email;
  String cellphone;
  DateTime subscriptionDate;
  String token;

  SalvaGuardasAdmin({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.cellphone,
    required this.subscriptionDate,
    required this.token,
  });

  SalvaGuardasAdmin copyWith({
    int? id,
    String? name,
    String? lastName,
    String? email,
    // String? cellphone,
    DateTime? subscriptionDate,
    String? token,
    String? cellphone,
  }) {
    return SalvaGuardasAdmin(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      cellphone: cellphone ?? this.cellphone,
      subscriptionDate: DateTime.fromMillisecondsSinceEpoch(
          subscriptionDate?.millisecondsSinceEpoch ??
              this.subscriptionDate.millisecondsSinceEpoch),
      token: token ?? this.token,
    );
  }

  factory SalvaGuardasAdmin.fromJson(Map<String, dynamic> json) {
    var user = json['user'];
    String token = json['token'];

    var name = user['name'] as String;
    int firstSpace = (name).indexOf(" ");
    var firstName = (name).substring(0, firstSpace);
    var lastName = (name).substring(firstSpace + 1);

    return SalvaGuardasAdmin(
      id: user["id"],
      name: firstName,
      lastName: lastName,
      email: user["email"],
      subscriptionDate: DateTime.fromMillisecondsSinceEpoch(user["dtCreated"]),
      token: token,
      cellphone: user["cellphone"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['cellphone'] = cellphone;
    data['subscriptionDate'] = subscriptionDate;
    data['token'] = token;
    return data;
  }

  @override
  String toString() {
    return 'SalvaGuardasUser(id: $id, name: $name, lastName: $lastName, cellphoe: $cellphone, email: $email, subscriptionDate: $subscriptionDate, token: $token)';
  }
}
