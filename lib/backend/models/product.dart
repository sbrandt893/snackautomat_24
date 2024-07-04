class Product {
  final String barcode;
  final String name;
  final int price;
  final String image;

  Product({
    required this.barcode,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      barcode: json['barcode'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }

  @override
  String toString() {
    return 'Product(barcode: $barcode, name: $name, price: $price, image: $image)';
  }
}
