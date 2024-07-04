import 'package:snackautomat_24/backend/models/product.dart';

class ProductDispensor {
  final List<Product> content;
  final int maxCapacity;

  ProductDispensor({
    required this.content,
    required this.maxCapacity,
  });

  ProductDispensor copyWith({
    List<Product>? content,
    int? maxCapacity,
  }) {
    return ProductDispensor(
      content: content ?? this.content,
      maxCapacity: maxCapacity ?? this.maxCapacity,
    );
  }

  factory ProductDispensor.empty() {
    return ProductDispensor(
      content: [],
      maxCapacity: 20,
    );
  }

  @override
  String toString() {
    return 'ProductDispensor(content: $content, maxCapacity: $maxCapacity)';
  }
}
