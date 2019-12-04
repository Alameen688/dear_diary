import 'package:dear_diary/services/api_service.dart';
import 'package:dio/dio.dart';

import 'locator.dart';

class EntryService {
  Dio apiClient;
  static ApiService apiService = locator<ApiService>();

  EntryService(): this.apiClient = apiService.client;

  Future<Response> getEntries() async {
    return apiClient.get('/entries');
  }

  Future<Response> addEntry(Map<String, String> entry) async {
    return apiClient.post('/entries',
        data: {'title': entry['title'], 'content': entry['content']});
  }

  Future<Response> updateEntry(Map<String, dynamic> entry) async {
    final String url = '/entries/${entry['id']}';
    return apiClient
        .put(url, data: {'title': entry['title'], 'content': entry['content']});
  }

  Future<Response> deleteEntry(int entryId) async {
    return apiClient.delete('/entries/$entryId');
  }
}
