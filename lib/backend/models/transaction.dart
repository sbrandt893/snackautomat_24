class Transaction {
  final String id;
  final String productBarcode;
  final int productPrice;
  final String timestamp;

  Transaction({
    required this.id,
    required this.productBarcode,
    required this.productPrice,
    required this.timestamp,
  });

  Transaction copyWith({
    String? id,
    String? productBarcode,
    int? productPrice,
    String? timestamp,
  }) {
    return Transaction(
      id: id ?? this.id,
      productBarcode: productBarcode ?? this.productBarcode,
      productPrice: productPrice ?? this.productPrice,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  String toString() {
    return 'Transaction(id: $id, productBarcode: $productBarcode, productPrice: $productPrice, timestamp: $timestamp)';
  }
}
