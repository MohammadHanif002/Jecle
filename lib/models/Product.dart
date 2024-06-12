class Product {
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}
