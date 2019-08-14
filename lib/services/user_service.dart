import 'package:dear_diary/models/user.dart';
import 'package:http/http.dart' show Client, Response;

class UserService {
  final Client apiClient = Client();
  static const _baseUrl = 'http://mydiaryoxygen.herokuapp.com/api/v1';

  Future<void> signUp(Map<String, String> userInfo) async {
    final String url = '$_baseUrl/auth/signup';
    Response response = await apiClient.post(url, body: {
      'fullname': userInfo['email'],
      'email': userInfo['email'],
      'password': userInfo['password']
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(response);
  }
}
