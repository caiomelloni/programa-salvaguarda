class Pendency {
  int? id;
  final DateTime date;
  final int year;
  final int month;
  final int idUser;

  Pendency({
    this.id,
    required this.date,
    required this.year,
    required this.month,
    required this.idUser,
  });

  Pendency copy({
    int? id,
    DateTime? date,
    int? year,
    int? month,
    int? idUser,
  }) =>
      Pendency(
        id: id ?? this.id,
        date: date ?? this.date,
        year: year ?? this.year,
        month: month ?? this.month,
        idUser: idUser ?? this.idUser,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pendency &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          date == other.date &&
          year == other.year &&
          month == other.month &&
          idUser == other.idUser;

  @override
  int get hashCode =>
      id.hashCode ^
      date.hashCode ^
      year.hashCode ^
      month.hashCode ^
      idUser.hashCode;
}
