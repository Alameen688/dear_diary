import 'package:dear_diary/utils/api_helper.dart';
import 'package:dio/dio.dart';

class EntryService {
  final Dio apiClient;
  static const baseUrl = BASE_URL;

  EntryService(this.apiClient);

  Future<Response> getEntries() async {
    final String url = '$baseUrl/entries';
    return apiClient.get(url);
  }

  Future<Response> addEntry(Map<String, String> entry) async {
    final String url = '$baseUrl/entries';
    return apiClient.post(url,
        data: {'title': entry['title'], 'content': entry['content']});
  }

  Future<Response> updateEntry(Map<String, dynamic> entry) async {
    final String url = '$baseUrl/entries/${entry['id']}';
    return apiClient
        .put(url, data: {'title': entry['title'], 'content': entry['content']});
  }

  Future<Response> deleteEntry(int entryId) async {
    return apiClient.delete('$baseUrl/entries/$entryId');
  }
}
