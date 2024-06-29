import 'package:snackautomat_24/backend/models/product.dart';

class Slot {
  final String slotNumber;
  final Product? product;
  final int? productQuantity;
  final int maxCapacity;

  Slot({
    required this.slotNumber,
    this.product,
    this.productQuantity,
    required this.maxCapacity,
  });

  Slot copyWith({
    String? slotNumber,
    Product? product,
    int? productQuantity,
    int? maxCapacity,
  }) {
    return Slot(
      slotNumber: slotNumber ?? this.slotNumber,
      product: product ?? this.product,
      productQuantity: productQuantity ?? this.productQuantity,
      maxCapacity: maxCapacity ?? this.maxCapacity,
    );
  }

  @override
  String toString() {
    return 'Slot(slotNumber: $slotNumber, product: $product, productQuantity: $productQuantity, maxCapacity: $maxCapacity)';
  }
}
