import 'package:my_emotion/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // 회원가입 API 연동
  Future<void> register(String username, String password) async {
    final url = '/api/register/';
    final body = {
      'username': username,
      'password': password,
    };

    try {
      final response = await ApiService.post(url, body);
      final token = response['token'];

      // 토큰 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      // 회원가입 성공 처리
    } catch (e) {
      // 에러 처리
      rethrow;
    }
  }

  // 로그인 API 연동
  Future<void> login(String username, String password) async {
    final url = '/api/login/';
    final body = {
      'username': username,
      'password': password,
    };

    try {
      final response = await ApiService.post(url, body);
      final token = response['token'];

      // 토큰 저장
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      // 로그인 성공 처리
    } catch (e) {
      // 에러 처리
      rethrow;
    }
  }
}
