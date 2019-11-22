import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { LOGGED_IN, LOGGED_OUT, IS_LOADING }

class AuthHelper {
  static saveInfo(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth-token', token);
  }

  static isAuth() async {
    final token = await getUserToken();
    return token.isNotEmpty ? AuthStatus.LOGGED_IN : AuthStatus.LOGGED_OUT;
  }

  static getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth-token') ?? '';
  }

  static removeUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('auth-token');
  }
}
