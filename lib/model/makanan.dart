class Makanan {
  String imageUrl;
  String description;
  String title;
  int price;

  Makanan({
    this.imageUrl,
    this.description,
    this.title,
    this.price});

}

final List<Makanan> item = [
  Makanan(
    imageUrl: 'assets/images/image01.jpg',
    title: 'Sate',
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
    price: 10000,
  ),

  Makanan(
    imageUrl: 'assets/images/image2.jpg',
    title: 'Pecel Lele',
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
    price: 7000,
  ),

  Makanan(
    imageUrl: 'assets/images/image3.jpg',
    title: 'Bakso',
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
    price: 15000,
  ),
];