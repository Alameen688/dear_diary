import 'package:dear_diary/utils/api_helper.dart';
import 'package:http/http.dart' show Client, Response;

class UserService {
  final Client apiClient = Client();
  static const _baseUrl = BASE_URL;

  Future<Response> signUp(Map<String, String> userInfo) async {
    final String url = '$_baseUrl/auth/signup';
    return apiClient.post(url, body: {
      'fullname': userInfo['email'],
      'email': userInfo['email'],
      'password': userInfo['password']
    });
  }

  Future<Response> login(Map<String, String> userInfo) async {
    final String url = '$_baseUrl/auth/login';
    return apiClient.post(url,
        body: {'email': userInfo['email'], 'password': userInfo['password']});
  }
}
