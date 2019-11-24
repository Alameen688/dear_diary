import 'package:dear_diary/models/entry.dart';
import 'package:dear_diary/services/diary_service.dart';
import 'package:dear_diary/services/locator.dart';
import 'package:dear_diary/view_model/base.dart';
import 'package:dio/dio.dart';

const ERROR_MESSAGE = "😥 Something went wrong. Please try again later!";

class EntryViewModel extends BaseViewModel {
  List<Entry> _entries = [];
  String _message;

  String get message => _message;

  List<Entry> get entries => _entries;

  DiaryService _diaryService = locator<DiaryService>();

  getEntries() async {
    setStatus(ViewStatus.Loading);
    Response response;
    try {
      _message = '';
      response = await _diaryService.getEntries();
      final List<dynamic> data = response.data['data'] ?? [];
      _entries = List<Entry>.from(data.map((entry) => Entry.fromJson(entry)));
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      _message = data['message'] ?? ERROR_MESSAGE;
    }
    setStatus(ViewStatus.Ready);
  }

  create(Map<String, String> formData) async {
    setStatus(ViewStatus.Loading);
    Response response;
    try {
      _message = '';
      response = await _diaryService.addEntry(formData);
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      _message = data['message'] ?? ERROR_MESSAGE;
    }
    setStatus(ViewStatus.Ready);

    return response?.statusCode;
  }

  update(Map<String, dynamic> formData) async {
    setStatus(ViewStatus.Loading);
    Response response;
    try {
      _message = '';
      response = await _diaryService.updateEntry(formData);
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      _message = data['message'] ?? ERROR_MESSAGE;
    }
    setStatus(ViewStatus.Ready);

    return response?.statusCode;
  }

  delete(int entryId) async {
    setStatus(ViewStatus.Loading);

    Response response;
    try {
      _message = '';
      response = await _diaryService.deleteEntry(entryId);
    } catch (e) {
      final data = e.response?.data ?? {};
      _message = data['message'] ?? ERROR_MESSAGE;
    }

    setStatus(ViewStatus.Loading);

    return response?.statusCode;
  }
}
