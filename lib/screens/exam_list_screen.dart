import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../data/mock_exams.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatefulWidget {
  final String studentIndex;

  const ExamListScreen({
    super.key,
    required this.studentIndex,
  });

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  late List<Exam> sortedExams;

  @override
  void initState() {
    super.initState();
    sortedExams = List.from(mockExams);
    sortedExams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Распоред за испити – ${widget.studentIndex}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sortedExams.length,
              itemBuilder: (context, index) {
                final exam = sortedExams[index];
                
                final cardColor = exam.isPast 
                    ? Colors.grey.shade300 
                    : Colors.blue.shade100;
                
                final borderColor = exam.isPast 
                    ? Colors.grey.shade500 
                    : Colors.blue.shade400;

                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: cardColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: borderColor, width: 1.5),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExamDetailScreen(
                            exam: exam,
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exam.subjectName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 18, color: Colors.blue.shade700),
                              const SizedBox(width: 8),
                              Text(
                                '${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year}',
                                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                              ),
                              const SizedBox(width: 20),
                              Icon(Icons.access_time, size: 18, color: Colors.orange.shade700),
                              const SizedBox(width: 8),
                              Text(
                                '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.meeting_room, size: 18, color: Colors.green.shade700),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  exam.rooms.join(', '),
                                  style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assignment,
                  color: Colors.deepPurple.shade700,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Вкупно испити: ${sortedExams.length}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

