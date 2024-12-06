import 'package:flutter/material.dart';
import 'package:my_emotion/models/diary.dart';
import 'package:my_emotion/services/diary_service.dart';

class DiaryListScreen extends StatefulWidget {
  const DiaryListScreen({super.key});

  @override
  _DiaryListScreenState createState() => _DiaryListScreenState();
}

class _DiaryListScreenState extends State<DiaryListScreen> {
  late Future<List<Diary>> _diariesFuture;

  @override
  void initState() {
    super.initState();
    DiaryService().getDiaries(DateTime.now()).then((diaries) => setState(() =>
        _diariesFuture = Future.value(
            diaries.map((diary) => Diary.fromJson(diary)).toList())));
  }

  Future<void> _refreshDiaries() async {
    setState(() {
      DiaryService().getDiaries(DateTime.now()).then((diaries) => setState(() =>
          _diariesFuture = Future.value(
              diaries.map((diary) => Diary.fromJson(diary)).toList())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일기 목록'),
      ),
      body: FutureBuilder<List<Diary>>(
        future: _diariesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('데이터가 없습니다.'));
          }
          final diaries = snapshot.data!;
          return RefreshIndicator(
            onRefresh: _refreshDiaries,
            child: ListView.builder(
              itemCount: diaries.length,
              itemBuilder: (context, index) {
                final diary = diaries[index];
                return ListTile(
                  title: Text(diary.title ?? '제목 없음'),
                  subtitle: Text(diary.content ?? '내용 없음'),
                  onTap: () {
                    // 일기 상세 화면으로 이동하는 로직 추가
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
