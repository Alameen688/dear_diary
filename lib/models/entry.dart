import 'package:dear_diary/utils/common.dart' show formatDate;

class Entry {
  int id;
  String title;
  String content;
  String imageUrl;
  String createdAt;

  Entry.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        imageUrl = json['image_url'],
        createdAt = formatDate(json['created_at']);
}
