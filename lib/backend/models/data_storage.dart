import 'package:snackautomat_24/backend/models/transaction.dart';
import 'package:uuid/uuid.dart';

class DataStorage {
  final String id;
  final List<Transaction> transactionLog;
  final int salesRevenue;

  DataStorage({
    required this.id,
    required this.transactionLog,
    required this.salesRevenue,
  });

  DataStorage copyWith({
    String? id,
    List<Transaction>? transactionLog,
    int? salesRevenue,
  }) {
    return DataStorage(
      id: id ?? this.id,
      transactionLog: transactionLog ?? this.transactionLog,
      salesRevenue: salesRevenue ?? this.salesRevenue,
    );
  }

  factory DataStorage.empty() {
    return DataStorage(
      id: const Uuid().v4(),
      transactionLog: [],
      salesRevenue: 0,
    );
  }

  @override
  String toString() {
    return 'DataStorage(id: $id, transactionLog: $transactionLog, salesRevenue: $salesRevenue)';
  }
}
