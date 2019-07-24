const slide_data = [
  SlideInfo('images/intro_1.jpeg', 'Pen down your imagination',
      'Your ideas have wings, let them fly! Give them a safe abode so you can easily refer to them anytime you wish.'),
  SlideInfo('images/intro_2.jpeg', 'The universe, your canvas',
      'The universe is yours to write! Adventures, travel experiences, Diary is handy for your convenient use.'),
  SlideInfo('images/intro_3.jpeg', 'We care about your moods',
      'Diary allows you to pen down stories that match your moods and emotions. It yours for the yours for the interest.'),
];

class SlideInfo {
  final String imageUrl;
  final String title;
  final String description;

  const SlideInfo(this.imageUrl, this.title, this.description);
}
