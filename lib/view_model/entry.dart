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
    try {
      Response response = await _diaryService.getEntries();
      var responseData = response.data;
      if (response.statusCode != 200) {
        _message = responseData['message'];
      } else {
        final List<dynamic> data = responseData['data'] ?? [];
        _entries = List<Entry>.from(data.map((entry) => Entry.fromJson(entry)));
      }
    } catch (e) {
      _message = ERROR_MESSAGE;
    } finally {
      setStatus(ViewStatus.Ready);
    }
  }

  create(Map<String, String> formData) async {
    setStatus(ViewStatus.Loading);
    Response response = await _diaryService.addEntry(formData);
    var responseData = response.data;
    if (response.statusCode != 201) {
      _message = responseData['message'];
    }
    setStatus(ViewStatus.Ready);

    return response.statusCode;
  }

  update(Map<String, dynamic> formData) async {
    setStatus(ViewStatus.Loading);
    Response response = await _diaryService.updateEntry(formData);
    if (response.statusCode != 200) {
      _message = response.data['message'];
    }
    setStatus(ViewStatus.Ready);

    return response.statusCode;
  }

  delete(int entryId) async {
    setStatus(ViewStatus.Loading);

    Response response;
    try {
      response = await _diaryService.deleteEntry(entryId);
      if (response.statusCode != 204) {
        _message = response.data['message'];
      }
    } catch (e) {
      _message = ERROR_MESSAGE;
    } finally {
      setStatus(ViewStatus.Loading);
    }

    return response.statusCode;
  }
}
