class Activity {
  final int hoursWorked;
  final String description;
  final String feedback;
  final DateTime date;

  Activity({
    required this.hoursWorked,
    required this.description,
    required this.feedback,
    required this.date,
  });

  Activity copy({
    int? hoursWorked,
    String? description,
    String? feedback,
    DateTime? date,
  }) =>
      Activity(
        hoursWorked: hoursWorked ?? this.hoursWorked,
        description: description ?? this.description,
        feedback: feedback ?? this.feedback,
        date: date ?? this.date,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Activity &&
          runtimeType == other.runtimeType &&
          hoursWorked == other.hoursWorked &&
          description == other.description &&
          feedback == other.feedback &&
          date == other.date;

  @override
  int get hashCode =>
      hoursWorked.hashCode ^
      description.hashCode ^
      feedback.hashCode ^
      date.hashCode;
}
