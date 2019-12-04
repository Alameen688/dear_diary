import 'package:dio/dio.dart';

class EntryService {
  final Dio apiClient;

  EntryService(this.apiClient);

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
