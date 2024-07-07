import 'package:snackautomat_24/backend/models/nullable_wrapper.dart';
import 'package:snackautomat_24/backend/models/product.dart';

class Slot {
  final String slotNumber;
  final Product? product;
  final int productQuantity;
  final int maxCapacity;

  Slot({
    required this.slotNumber,
    this.product,
    required this.productQuantity,
    required this.maxCapacity,
  });

  Slot copyWith({
    Wrapper<Product?>? product,
    int? productQuantity,
    int? maxCapacity,
  }) {
    return Slot(
      slotNumber: slotNumber, // slotNumber can't be changed
      product: product != null ? product.value : this.product,
      productQuantity: productQuantity ?? this.productQuantity,
      maxCapacity: maxCapacity ?? this.maxCapacity,
    );
  }

  @override
  String toString() {
    return 'Slot(slotNumber: $slotNumber, product: $product, productQuantity: $productQuantity, maxCapacity: $maxCapacity)';
  }

  Slot addProduct({required Product product}) {
    if (this.product != null && this.product!.barcode != product.barcode) {
      throw Exception('Slot already contains a different product');
    }
    if (productQuantity >= maxCapacity) {
      return this;
    }
    return copyWith(
      product: Wrapper(product),
      productQuantity: productQuantity + 1,
    );
  }

  Slot removeProduct() {
    if (product == null || productQuantity == 0) {
      return copyWith(product: Wrapper(null), productQuantity: 0);
    }
    int newQuantity = productQuantity - 1;
    if (newQuantity <= 0) {
      return copyWith(product: Wrapper(null), productQuantity: 0);
    }
    return copyWith(
      productQuantity: newQuantity,
    );
  }
}
