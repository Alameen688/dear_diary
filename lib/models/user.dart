class User {
  int id;
  String fullName;
  String content;
  String email;
  String entryCount;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        fullName = json['fullname'],
        email = json['email'],
        entryCount = json['entry_count'];
}
