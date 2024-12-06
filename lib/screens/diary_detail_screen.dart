import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryDetailScreen extends StatelessWidget {
  final DateTime date;
  final String content;
  final String time;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const DiaryDetailScreen({
    super.key,
    required this.date,
    required this.content,
    required this.time,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일기 상세'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              '작성 시간: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(time))}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 사용자 의도치 않은 닫기 방지
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            '정말로 이 일기를 삭제하시겠습니까?',
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 버튼들 중앙 정렬
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                    },
                    child: const Text('취소'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // 다이얼로그 닫기
                      onDelete(); // 일기 삭제
                      Navigator.of(context)
                          .pop(); // Return to the previous screen
                    },
                    child: const Text('삭제'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
