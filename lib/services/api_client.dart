import 'package:dear_diary/utils/auth_helper.dart';
import 'package:dio/dio.dart';

const BASE_URL = 'http://mydiaryoxygen.herokuapp.com/api/v1';

Future<Dio> apiClientSetup() async {
  Dio apiClient = Dio();
  final authToken = await AuthHelper.getUserToken();
  apiClient.options.baseUrl = BASE_URL;
  apiClient.options.headers['Authorization'] = 'Bearer $authToken';
  return apiClient;
}
