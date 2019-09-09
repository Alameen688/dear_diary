import 'package:dear_diary/utils/common.dart' show formatDate;

class Entry {
  String title;
  String content;
  String createdAt;

  Entry.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        createdAt = formatDate(json['created_at']);
}
