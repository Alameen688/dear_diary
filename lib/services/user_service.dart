import 'package:dear_diary/services/api_service.dart';
import 'package:dio/dio.dart';

import 'locator.dart';

class UserService {
  Dio apiClient;

  static ApiService apiService = locator<ApiService>();

  UserService() : this.apiClient = apiService.client;

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
