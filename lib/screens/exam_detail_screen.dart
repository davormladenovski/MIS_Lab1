import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({
    super.key,
    required this.exam,
  });

  String _getTimeRemaining() {
    final now = DateTime.now();
    final examDate = exam.dateTime;
    
    if (exam.isPast) {
      final difference = now.difference(examDate);
      final days = difference.inDays;
      final hours = difference.inHours % 24;
      return 'Испитот беше пред $days ${days == 1 ? 'ден' : 'дена'}, $hours ${hours == 1 ? 'час' : 'часа'}';
    }

    if (examDate.isBefore(now)) {
      return 'Испитот се одржува сега';
    }

    final difference = examDate.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return '$days ${days == 1 ? 'ден' : 'дена'}, $hours ${hours == 1 ? 'час' : 'часа'}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Детали за испит',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                color: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.school,
                        size: 60,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        exam.subjectName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildDetailTile(
                icon: Icons.calendar_today,
                iconColor: Colors.blue,
                title: 'Датум',
                value: '${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year}',
              ),
              const SizedBox(height: 16),
              _buildDetailTile(
                icon: Icons.access_time,
                iconColor: Colors.orange,
                title: 'Време',
                value: '${exam.dateTime.hour.toString().padLeft(2, '0')}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
              ),
              const SizedBox(height: 16),
              _buildDetailTile(
                icon: Icons.meeting_room,
                iconColor: Colors.green,
                title: 'Соба',
                value: exam.rooms.join(', '),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 3,
                color: exam.isPast ? Colors.grey.shade200 : Colors.orange.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Icon(
                        exam.isPast ? Icons.history : Icons.timer,
                        color: exam.isPast ? Colors.grey.shade700 : Colors.orange.shade700,
                        size: 32,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exam.isPast ? 'Време од испитот' : 'Преостанато време',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: exam.isPast ? Colors.grey.shade700 : Colors.orange.shade700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _getTimeRemaining(),
                              style: TextStyle(
                                fontSize: 18,
                                color: exam.isPast ? Colors.grey.shade800 : Colors.orange.shade900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

