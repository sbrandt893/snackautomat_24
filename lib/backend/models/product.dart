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

  Product copyWith({
    String? barcode,
    String? name,
    int? price,
    String? image,
  }) {
    return Product(
      barcode: barcode ?? this.barcode,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

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
