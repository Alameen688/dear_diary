List<EntryInfo> entriesData = [
  EntryInfo('In the begining', 'Everything was awesome', 'March 13th 2019',
      'images/entry_1.jpg'),
];

class EntryInfo {
  String title;
  String description;
  String date;
  String imageUrl;

  EntryInfo(this.title, this.description, this.date, this.imageUrl);
}
