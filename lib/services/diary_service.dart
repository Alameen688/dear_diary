import 'package:http/http.dart' show Client;

class DiaryService {
  final Client apiClient = Client();
  static const _baseUrl = 'http://mydiaryoxygen.herokuapp.com/api/v1';

  getEntries() {
    apiClient.get(_baseUrl);
  }
}
