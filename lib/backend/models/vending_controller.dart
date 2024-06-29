import 'package:snackautomat_24/backend/models/product.dart';

class VendingController {
  final String displayMessage;
  final Product? selectedProduct;
  final int cacheAmount;

  VendingController({
    required this.displayMessage,
    this.selectedProduct,
    required this.cacheAmount,
  });

  VendingController copyWith({
    String? displayMessage,
    Product? selectedProduct,
    int? cacheAmount,
  }) {
    return VendingController(
      displayMessage: displayMessage ?? this.displayMessage,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      cacheAmount: cacheAmount ?? this.cacheAmount,
    );
  }

  factory VendingController.standard() {
    return VendingController(
      displayMessage: 'Hello there!',
      cacheAmount: 0,
    );
  }

  @override
  String toString() {
    return 'VendingController(displayMessage: $displayMessage, selectedProduct: $selectedProduct, cacheAmount: $cacheAmount)';
  }

  // selectProduct method
  VendingController selectProduct(Product product) {
    return VendingController(
      displayMessage: 'Product selected: ${product.name}',
      selectedProduct: product,
      cacheAmount: cacheAmount,
    );
  }
}
