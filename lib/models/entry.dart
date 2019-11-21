import 'package:dear_diary/utils/common.dart' show formatDate;

class Entry {
  int id;
  String title;
  String content;
  String createdAt;

  Entry.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        createdAt = formatDate(json['created_at']);
}
