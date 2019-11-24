import 'package:dear_diary/models/user.dart';
import 'package:dear_diary/services/dialog_service.dart';
import 'package:dear_diary/services/locator.dart';
import 'package:dear_diary/services/user_service.dart';
import 'package:dear_diary/utils/auth_helper.dart';
import 'package:dear_diary/view_model/base.dart';
import 'package:dio/dio.dart';

const ERROR_MESSAGE = "😥 Something went wrong. Please try again later!";

class UserViewModel extends BaseViewModel {
  DialogService _dialogService = locator<DialogService>();

  String _message;
  User _userProfile;

  UserService _userService = locator<UserService>();

  String get message => _message;

  User get userProfile => _userProfile;

  Future<bool> create(Map<String, String> formData) async {
    setStatus(ViewStatus.Loading);
    Response response;
    try {
      response = await _userService.signUp(formData);
      setStatus(ViewStatus.Ready);
      await _dialogService
          .showDialog("Yay! Your account has been created. Continue!");
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      final message = data['message'] ?? ERROR_MESSAGE;
      setStatus(ViewStatus.Ready);
      _dialogService.showDialog(message);
    }

    return response?.statusCode == 201;
  }

  Future<bool> login(Map<String, String> formData) async {
    setStatus(ViewStatus.Loading);
    Response response;
    try {
      response = await _userService.login(formData);
      var responseData = response.data['data'];
      final String token = responseData['token'] ?? '';
      if (token.isNotEmpty) {
        AuthHelper.saveInfo(token);
      }
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      final message = data['message'] ?? ERROR_MESSAGE;
      _dialogService.showDialog(message);
    }
    setStatus(ViewStatus.Ready);

    return response?.statusCode == 200;
  }

  Future<void> getUserProfile() async {
    setStatus(ViewStatus.Loading);
    _message = '';
    try {
      Response response = await _userService.profile();
      var responseData = response.data['data'];
      _userProfile = User.fromJson(responseData);
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      _message = data['message'] ?? ERROR_MESSAGE;
    }
    setStatus(ViewStatus.Ready);
  }
}
