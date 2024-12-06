import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_emotion/services/api_service.dart';

class DiaryService {
  final String baseUrl = '/api/diaries';

  Future<List<Map<String, dynamic>>> getDiaries(DateTime selectedDate) async {
    print("getDiaries - selectedDate: ${selectedDate.toIso8601String()}");
    final url =
        '$baseUrl/list/?date=${DateFormat('yyyy-MM-dd').format(selectedDate)}';
    final response = await ApiService.get(url);
    print(
        "getDiaries - response: ${List<Map<String, dynamic>>.from(response)}");
    if (response is List) {
      return List<Map<String, dynamic>>.from(response);
    } else {
      throw Exception('Failed to load diaries');
    }
  }

  Future<Map<String, dynamic>> createDiary(
      String content, DateTime writeDate) async {
    print("createDiary - writeDate: ${writeDate.toIso8601String()}");
    final response = await ApiService.post('$baseUrl/create/', {
      'content': content,
      'write_date': writeDate.toIso8601String(),
    });

    if (response is Map<String, dynamic>) {
      return response;
    } else {
      throw Exception('Failed to create diary');
    }
  }

  Future<Map<String, dynamic>> updateDiary(int id, String content) async {
    print("updateDiary - content: $content");
    final response = await ApiService.put('$baseUrl/$id/update/', {
      'content': content,
    });

    if (response is Map<String, dynamic>) {
      return response;
    } else {
      print("updateDiary - response: ${response.body}");
      throw Exception('Failed to update diary');
    }
  }

  Future<void> deleteDiary(int id) async {
    await ApiService.delete('$baseUrl/$id/delete/');
  }
}
