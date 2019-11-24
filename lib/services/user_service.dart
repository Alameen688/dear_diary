import 'package:dear_diary/utils/api_helper.dart';
import 'package:dio/dio.dart';

class UserService {
  final Dio apiClient;
  static const baseUrl = BASE_URL;

  UserService(this.apiClient);

  Future<Response> signUp(Map<String, String> userInfo) async {
    final String url = '$baseUrl/auth/signup';
    return apiClient.post(url, data: {
      'fullname': userInfo['fullname'],
      'email': userInfo['email'],
      'password': userInfo['password']
    });
  }

  Future<Response> login(Map<String, String> userInfo) async {
    final String url = '$baseUrl/auth/login';
    return apiClient.post(url,
        data: {'email': userInfo['email'], 'password': userInfo['password']});
  }

  Future<Response> profile() async {
    return apiClient.get('$baseUrl/users/profile');
  }
}
