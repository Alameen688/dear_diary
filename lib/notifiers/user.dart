import 'package:dear_diary/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Response;
import 'dart:convert' show jsonDecode;

class UserModel with ChangeNotifier {
  bool _isLoading = false;
  bool _userCreated = false;
  String _message;

  var userService = UserService();

  bool get isLoading => _isLoading;

  String get message => _message;

  bool get userCreated => _userCreated;

  create(Map<String, String> formData) async {
    _isLoading = true;
    notifyListeners();
    Response response = await userService.signUp(formData);
    _isLoading = false;
    notifyListeners();
    if (response.statusCode != 201) {
      var data = jsonDecode(response.body);
      _message = data['message'];
    }
    return response.statusCode;
  }
}
