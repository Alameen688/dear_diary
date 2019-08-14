import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

class User with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

}