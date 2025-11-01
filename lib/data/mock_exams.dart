import '../models/exam.dart';

List<Exam> _generateExams() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  
  return [
    Exam(
      subjectName: 'Оперативни системи',
      dateTime: today.subtract(const Duration(days: 5)).add(const Duration(hours: 9)),
      rooms: ['Сала А', 'Сала Б'],
    ),
    Exam(
      subjectName: 'Компјутерски мрежи',
      dateTime: today.subtract(const Duration(days: 4)).add(const Duration(hours: 10, minutes: 30)),
      rooms: ['Сала В', 'Сала Г', 'Соба 301'],
    ),
    Exam(
      subjectName: 'Системи на бази на податоци',
      dateTime: today.subtract(const Duration(days: 3)).add(const Duration(hours: 8)),
      rooms: ['Лабораторија 1', 'Лабораторија 2'],
    ),
    Exam(
      subjectName: 'Софтверско инженерство',
      dateTime: today.subtract(const Duration(days: 2)).add(const Duration(hours: 14)),
      rooms: ['Сала Д'],
    ),
    Exam(
      subjectName: 'Веб развој',
      dateTime: today.subtract(const Duration(days: 1)).add(const Duration(hours: 11)),
      rooms: ['Лабораторија 3', 'Лабораторија 4'],
    ),
    Exam(
      subjectName: 'Мобилни системи',
      dateTime: today.add(const Duration(days: 1, hours: 9, minutes: 30)),
      rooms: ['Сала Е', 'Сала Ж'],
    ),
    Exam(
      subjectName: 'Структури на податоци',
      dateTime: today.add(const Duration(days: 2, hours: 13)),
      rooms: ['Соба 201', 'Соба 202', 'Соба 203'],
    ),
    Exam(
      subjectName: 'Алгоритми',
      dateTime: today.add(const Duration(days: 3, hours: 10)),
      rooms: ['Сала З'],
    ),
    Exam(
      subjectName: 'Машинско учење',
      dateTime: today.add(const Duration(days: 4, hours: 8, minutes: 30)),
      rooms: ['Лабораторија 5', 'Лабораторија 6'],
    ),
    Exam(
      subjectName: 'Компјутерска графика',
      dateTime: today.add(const Duration(days: 5, hours: 15)),
      rooms: ['Сала И', 'Сала Ј'],
    ),
    Exam(
      subjectName: 'Информациска безбедност',
      dateTime: today.add(const Duration(days: 7, hours: 12)),
      rooms: ['Соба 401'],
    ),
    Exam(
      subjectName: 'Дистрибуирани системи',
      dateTime: today.add(const Duration(days: 10, hours: 9)),
      rooms: ['Сала К', 'Лабораторија 7'],
    ),
    Exam(
      subjectName: 'Компјутерска архитектура',
      dateTime: today.add(const Duration(days: 12, hours: 11, minutes: 30)),
      rooms: ['Сала Л', 'Лабораторија 8'],
    ),
  ];
}

final List<Exam> mockExams = _generateExams();

