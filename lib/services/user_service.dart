import 'package:dio/dio.dart';

class UserService {
  final Dio apiClient;

  UserService(this.apiClient);

  Future<Response> signUp(Map<String, String> userInfo) async {
    final String url = '/auth/signup';
    return apiClient.post(url, data: {
      'fullname': userInfo['fullname'],
      'email': userInfo['email'],
      'password': userInfo['password']
    });
  }

  Future<Response> login(Map<String, String> userInfo) async {
    final String url = '/auth/login';
    return apiClient.post(url,
        data: {'email': userInfo['email'], 'password': userInfo['password']});
  }

  Future<Response> profile() async {
    return apiClient.get('/users/profile');
  }
}
