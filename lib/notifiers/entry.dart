import 'package:dear_diary/services/diary_service.dart';
import 'package:flutter/material.dart';

class DiaryEntry with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  var diaryService = DiaryService();

  getEntries() async {
    _isLoading = true;
    notifyListeners();
    diaryService.getEntries();
  }
}