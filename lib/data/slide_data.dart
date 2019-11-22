const slide_data = [
  SlideInfo('images/slide_1.jpg', 'Explore the world around you'),
  SlideInfo('images/slide_2.jpg', 'Write about every moment'),
  SlideInfo('images/slide_3.jpg', 'Reflect on your life experiences '),
];

class SlideInfo {
  final String imageUrl;
  final String title;

  const SlideInfo(this.imageUrl, this.title);
}
