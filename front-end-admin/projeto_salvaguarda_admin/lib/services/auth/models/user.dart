class SalvaGuardasUser {
  String name;
  String lastName;
  String email;
  String phoneNumber;
  String subscriptionDate;

  SalvaGuardasUser({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.subscriptionDate,
  });

  SalvaGuardasUser copyWith({
    String? name,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? subscriptionDate,
  }) {
    return SalvaGuardasUser(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      subscriptionDate: subscriptionDate ?? this.subscriptionDate,
    );
  }

  factory SalvaGuardasUser.fromJson(Map<String, dynamic> json) {
    return SalvaGuardasUser(
      name: json["name"],
      lastName: json["lastName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      subscriptionDate: json["subscriptionDate"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['subscriptionDate'] = subscriptionDate;
    return data;
  }
}
