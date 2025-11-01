class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;

  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
  });

  bool get isPast {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final examDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return examDate.isBefore(today);
  }
}

