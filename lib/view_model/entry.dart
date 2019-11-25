import 'package:dear_diary/models/entry.dart';
import 'package:dear_diary/services/dialog_service.dart';
import 'package:dear_diary/services/entry_service.dart';
import 'package:dear_diary/services/locator.dart';
import 'package:dear_diary/view_model/base.dart';
import 'package:dio/dio.dart';

const ERROR_MESSAGE = "😥 Something went wrong. Please try again later!";

class EntryViewModel extends BaseViewModel {
  List<Entry> _entries = [];
  String _message;

  String get message => _message;

  List<Entry> get entries => _entries;

  EntryService _entryService = locator<EntryService>();
  DialogService _dialogService = locator<DialogService>();

  Future<void> getEntries() async {
    setStatus(ViewStatus.Loading);
    Response response;
    try {
      _message = '';
      response = await _entryService.getEntries();
      final List<dynamic> data = response.data['data'] ?? [];
      _entries = List<Entry>.from(data.map((entry) => Entry.fromJson(entry)));
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      _message = data['message'] ?? ERROR_MESSAGE;
    }
    setStatus(ViewStatus.Ready);
  }

  Future<bool> create(Map<String, String> formData) async {
    setStatus(ViewStatus.Loading);
    Response response;
    try {
      response = await _entryService.addEntry(formData);
      setStatus(ViewStatus.Ready);
      await _dialogService.showAlertDialog(
          'Gotcha 😎! Thanks for sharing your thoughts with me today!',
          barrierDismissible: false);
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      final message = data['message'] ?? ERROR_MESSAGE;
      setStatus(ViewStatus.Ready);
      _dialogService.showAlertDialog(message);
    }

    return response?.statusCode == 201;
  }

  Future<bool> update(Map<String, dynamic> formData) async {
    setStatus(ViewStatus.Loading);
    Response response;
    try {
      response = await _entryService.updateEntry(formData);
      setStatus(ViewStatus.Ready);
      await _dialogService.showAlertDialog(
          'Well recieved 😎! Thanks for the update',
          barrierDismissible: false);
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      final message = data['message'] ?? ERROR_MESSAGE;
      setStatus(ViewStatus.Ready);
      _dialogService.showAlertDialog(message);
    }

    return response?.statusCode == 200;
  }

  delete(int entryId) async {
    setStatus(ViewStatus.Loading);

    Response response;
    try {
      response = await _entryService.deleteEntry(entryId);
      await Future.delayed(Duration(seconds: 10));
      await _dialogService
          .showAlertDialog('Okay! here you go. Entry deleted successfully!');
      setStatus(ViewStatus.Ready);
    } on DioError catch (e) {
      final data = e.response?.data ?? {};
      final message = data['message'] ?? ERROR_MESSAGE;
      setStatus(ViewStatus.Ready);
      _dialogService.showAlertDialog(message);
    }

    return response?.statusCode == 204;
  }
}
