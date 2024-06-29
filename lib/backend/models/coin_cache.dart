import 'package:snackautomat_24/backend/models/coin.dart';

class CoinCache {
  final Map<int, List<Coin>> coinTubes;
  final Map<int, int> tubesCapacity;
  final Map<int, double> fillLevels;
  final int totalAmount;

  CoinCache({
    required this.coinTubes,
    required this.tubesCapacity,
    required this.fillLevels,
    required this.totalAmount,
  });

  CoinCache copyWith({
    Map<int, List<Coin>>? coinTubes,
    Map<int, int>? tubesCapacity,
    Map<int, double>? fillLevels,
    int? totalAmount,
  }) {
    return CoinCache(
      coinTubes: coinTubes ?? this.coinTubes,
      tubesCapacity: tubesCapacity ?? this.tubesCapacity,
      fillLevels: fillLevels ?? this.fillLevels,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  factory CoinCache.empty() {
    return CoinCache(
      coinTubes: {
        1: [],
        2: [],
        5: [],
        10: [],
        20: [],
        50: [],
        100: [],
        200: [],
      },
      tubesCapacity: {
        1: 20,
        2: 20,
        5: 20,
        10: 20,
        20: 20,
        50: 20,
        100: 20,
        200: 20,
      },
      fillLevels: {
        1: 0,
        2: 0,
        5: 0,
        10: 0,
        20: 0,
        50: 0,
        100: 0,
        200: 0,
      },
      totalAmount: 0,
    );
  }

  @override
  String toString() {
    return 'CoinCache(coinTubes: $coinTubes, tubesCapacity: $tubesCapacity, fillLevels: $fillLevels, totalAmount: $totalAmount)';
  }
}
