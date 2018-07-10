class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'Counter Strike', category: 'Counter Strike', imageUrl: 'images/cs_nb.png',),
  new IntroItem(title: 'Krosmaga', category: 'Krosmaga', imageUrl: 'images/kros.png',),
  new IntroItem(title: 'Overwatch', category: 'Overwatch', imageUrl: 'images/ow.png',),
];