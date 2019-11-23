import 'package:dear_diary/models/user.dart';
import 'package:dear_diary/services/locator.dart';
import 'package:dear_diary/services/user_service.dart';
import 'package:dear_diary/utils/auth_helper.dart';
import 'package:dear_diary/view_model/base.dart';
import 'package:dio/dio.dart';

const ERROR_MESSAGE = "😥 Something went wrong. Please try again later!";

class UserViewModel extends BaseViewModel {
  String _message;
  User _userProfile;

  UserService _userService = locator<UserService>();

  String get message => _message;

  User get userProfile => _userProfile;

  create(Map<String, String> formData) async {
    setStatus(ViewStatus.Loading);

    Response response = await _userService.signUp(formData);
    _message = '';
    if (response.statusCode != 201) {
      _message = response.data['message'];
    }
    setStatus(ViewStatus.Ready);

    return response.statusCode;
  }

  login(Map<String, String> formData) async {
    setStatus(ViewStatus.Loading);
    _message = '';
    Response response = await _userService.login(formData);
    var responseData = response.data;
    if (response.statusCode != 200) {
      _message = responseData['message'];
    } else {
      final String token = responseData['token'] ?? '';
      if (token.isNotEmpty) {
        AuthHelper.saveInfo(token);
      }
    }
    setStatus(ViewStatus.Ready);

    return response.statusCode;
  }

  void getUserProfile() async {
    setStatus(ViewStatus.Loading);

    try {
      Response response = await _userService.profile();
      var responseData = response.data;
      if (response.statusCode != 200) {
        _message = responseData['message'];
      } else {
        _userProfile = User.fromJson(responseData['data']);
      }
    } catch (e) {
      _message = ERROR_MESSAGE;
    } finally {
      setStatus(ViewStatus.Ready);
    }
  }
}
