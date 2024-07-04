import 'package:snackautomat_24/backend/models/coin.dart';
import 'package:uuid/uuid.dart';

class CoinSafe {
  final String id;
  final List<Coin> coins;
  final int maxCapacity;
  final double fillLevel;
  final int totalAmount;

  CoinSafe({
    required this.id,
    required this.coins,
    required this.maxCapacity,
    required this.fillLevel,
    required this.totalAmount,
  });

  CoinSafe copyWith({
    String? id,
    List<Coin>? coins,
    int? maxCapacity,
    double? fillLevel,
    int? totalAmount,
  }) {
    return CoinSafe(
      id: id ?? this.id,
      coins: coins ?? this.coins,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      fillLevel: fillLevel ?? this.fillLevel,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  factory CoinSafe.empty() {
    return CoinSafe(
      id: const Uuid().v4(),
      coins: [],
      maxCapacity: 1000,
      fillLevel: 0,
      totalAmount: 0,
    );
  }

  @override
  String toString() {
    return 'CoinSafe{id: $id, coins: $coins, maxCapacity: $maxCapacity, fillLevel: $fillLevel, totalAmount: $totalAmount}';
  }
}
