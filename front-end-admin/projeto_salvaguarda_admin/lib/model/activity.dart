class Activity {
  int? id;
  final int hoursWorked;
  final String description;
  final String feedback;
  final DateTime date;
  final int year;
  final int month;
  final int idUser;

  Activity({
    this.id,
    required this.hoursWorked,
    required this.description,
    required this.feedback,
    required this.date,
    required this.year,
    required this.month,
    required this.idUser,
  });

  Activity copy({
    int? id,
    int? hoursWorked,
    String? description,
    String? feedback,
    DateTime? date,
    int? year,
    int? month,
    int? idUser,
  }) =>
      Activity(
        id: id ?? this.id,
        hoursWorked: hoursWorked ?? this.hoursWorked,
        description: description ?? this.description,
        feedback: feedback ?? this.feedback,
        date: date ?? this.date,
        year: year ?? this.year,
        month: month ?? this.month,
        idUser: idUser ?? this.idUser,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Activity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          hoursWorked == other.hoursWorked &&
          description == other.description &&
          feedback == other.feedback &&
          date == other.date &&
          year == other.year &&
          month == other.month &&
          idUser == other.idUser;

  @override
  int get hashCode =>
      id.hashCode ^
      hoursWorked.hashCode ^
      description.hashCode ^
      feedback.hashCode ^
      date.hashCode ^
      year.hashCode ^
      month.hashCode ^
      idUser.hashCode;
}
