import 'package:http/http.dart' show Client, Response;

class UserService {
  final Client apiClient = Client();
  static const _baseUrl = 'http://mydiaryoxygen.herokuapp.com/api/v1';

  Future<Response> signUp(Map<String, String> userInfo) async {
    final String url = '$_baseUrl/auth/signup';
    return apiClient.post(url, body: {
      'fullname': userInfo['email'],
      'email': userInfo['email'],
      'password': userInfo['password']
    });
  }
}
