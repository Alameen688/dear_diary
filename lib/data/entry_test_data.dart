List<EntryInfo> entriesData = [
  EntryInfo('In the beginning there was no one to be there', 'Everything was awesome', 'March 13th 2019',
      'images/entry_1.jpg'),
  EntryInfo('I learnt the first thing was', 'Everything was awesome', 'March 20th 2019',
      'images/entry_2.jpg'),
  EntryInfo('First day at work', 'Everything was awesome', 'March 20th 2019',
      'images/entry_3.jpg'),
  EntryInfo('Road Trip', 'Everything was awesome', 'March 20th 2019',
      'images/entry_4.jpg'),
  EntryInfo('Time flies', 'Everything was awesome', 'March 20th 2019',
      'images/entry_5.jpg'),
];

class EntryInfo {
  String title;
  String description;
  String date;
  String imageUrl;

  EntryInfo(this.title, this.description, this.date, this.imageUrl);
}
