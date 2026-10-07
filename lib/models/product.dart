class Product {
  //place where we stor our data
  final String id;
  final String name;
  final double price;
  final String image;
  final String category;

  //it make mandetory to enter data
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });
}
