import 'package:dear_diary/models/user.dart';
import 'package:dear_diary/services/user_service.dart';
import 'package:dear_diary/utils/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'dart:convert' show jsonDecode;

const ERROR_MESSAGE = "😥 Something went wrong. Please try again later!";

class UserModel with ChangeNotifier {
  bool _isLoading = false;
  bool _userCreated = false;
  String _message;
  User _userProfile;

  var userService = UserService();

  bool get isLoading => _isLoading;

  String get message => _message;

  bool get userCreated => _userCreated;

  User get userProfile => _userProfile;

  create(Map<String, String> formData) async {
    _isLoading = true;
    notifyListeners();
    Response response = await userService.signUp(formData);
    _isLoading = false;
    notifyListeners();
    _message = '';
    if (response.statusCode != 201) {
      var resBody = jsonDecode(response.body);
      _message = resBody['message'];
    }
    return response.statusCode;
  }

  login(Map<String, String> formData) async {
    _isLoading = true;
    notifyListeners();
    _message = '';
    Response response = await userService.login(formData);
    _isLoading = false;
    notifyListeners();
    var resBody = jsonDecode(response.body);
    if (response.statusCode != 200) {
      _message = resBody['message'];
    } else {
      final String token = resBody['data']['token'] ?? '';
      if (token.isNotEmpty) {
        AuthHelper.saveInfo(token);
      }
    }
    return response.statusCode;
  }

  void getUserProfile() async {
    _isLoading = true;
    try {
      Response response = await userService.profile();
      var resBody = jsonDecode(response.body);
      if (response.statusCode != 200) {
        _message = resBody['message'];
      } else {
        _userProfile = User.fromJson(resBody['data']);
      }
    } catch (e) {
      _message = ERROR_MESSAGE;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
