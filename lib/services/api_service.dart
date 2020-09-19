import 'package:dear_diary/utils/auth_helper.dart';
import 'package:dio/dio.dart';

const BASE_URL = 'https://mydiaryoxygen.herokuapp.com/api/v1';

class ApiService {
  Dio client;
  ApiService() {
    this.client = Dio();
    this.client.options.baseUrl = BASE_URL;
    this.client.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true, 
        responseBody: true
    ));
  }

  void setToken(String authToken) {
    this.client.options.headers['Authorization'] = 'Bearer $authToken';
  }

  Future<void> clientSetup() async {
    final String authToken = await AuthHelper.getUserToken();
    if (authToken.isNotEmpty)
      this.client.options.headers['Authorization'] = 'Bearer $authToken';
  }
}
