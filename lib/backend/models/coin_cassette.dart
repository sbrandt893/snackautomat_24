import 'package:snackautomat_24/backend/models/coin.dart';
import 'package:uuid/uuid.dart';

class CoinCassette {
  final String id;
  final Map<int, List<Coin>> coinTubes;
  final Map<int, int> tubesCapacity;
  final Map<int, double> fillLevels;
  final int totalAmount;

  CoinCassette({
    required this.coinTubes,
    required this.tubesCapacity,
  })  : id = const Uuid().v4(),
        fillLevels = coinTubes.map((key, value) => MapEntry(key, value.length * 100 / tubesCapacity[key]!)),
        totalAmount = coinTubes.values.fold(0, (previousValue, element) => previousValue + element.length);

  CoinCassette copyWith({
    Map<int, List<Coin>>? coinTubes,
    Map<int, int>? tubesCapacity,
  }) {
    return CoinCassette(
      coinTubes: coinTubes ?? this.coinTubes,
      tubesCapacity: tubesCapacity ?? this.tubesCapacity,
    );
  }

  // creates a custom CoinCassette with parameters or a standard CoinCassette without parameters
  factory CoinCassette.custom(
      {Map<int, int> denominationsAndQuantity = const {1: 100, 2: 100, 5: 100, 10: 100, 20: 100, 50: 100, 100: 100, 200: 100},
      Map<int, int> tubesCapacity = const {1: 100, 2: 100, 5: 100, 10: 100, 20: 100, 50: 100, 100: 100, 200: 100}}) {
    final coinTubes = denominationsAndQuantity.map((denomination, quantity) {
      return MapEntry(
          denomination,
          List.generate(quantity, (index) {
            return Coin.fromDenomination(denomination);
          }));
    });
    return CoinCassette(
      coinTubes: coinTubes,
      tubesCapacity: tubesCapacity,
    );
  }

  factory CoinCassette.standardFilled() {
    return CoinCassette.custom();
  }

  factory CoinCassette.standardEmpty() {
    return CoinCassette.custom(denominationsAndQuantity: {1: 0, 2: 0, 5: 0, 10: 0, 20: 0, 50: 0, 100: 0, 200: 0});
  }

  factory CoinCassette.largeFilled() {
    return CoinCassette.custom(
      denominationsAndQuantity: {1: 500, 2: 500, 5: 500, 10: 450, 20: 400, 50: 350, 100: 350, 200: 300},
      tubesCapacity: {1: 500, 2: 500, 5: 500, 10: 450, 20: 400, 50: 350, 100: 350, 200: 300},
    );
  }

  factory CoinCassette.largeEmpty() {
    return CoinCassette.custom(
      denominationsAndQuantity: {1: 0, 2: 0, 5: 0, 10: 0, 20: 0, 50: 0, 100: 0, 200: 0},
      tubesCapacity: {1: 500, 2: 500, 5: 500, 10: 450, 20: 400, 50: 350, 100: 350, 200: 300},
    );
  }

  factory CoinCassette.smallFilled() {
    return CoinCassette.custom(
      denominationsAndQuantity: {1: 200, 2: 200, 5: 200, 10: 150, 20: 150, 50: 150, 100: 100, 200: 100},
      tubesCapacity: {1: 200, 2: 200, 5: 200, 10: 150, 20: 150, 50: 150, 100: 100, 200: 100},
    );
  }

  factory CoinCassette.smallEmpty() {
    return CoinCassette.custom(
      denominationsAndQuantity: {1: 0, 2: 0, 5: 0, 10: 0, 20: 0, 50: 0, 100: 0, 200: 0},
      tubesCapacity: {1: 200, 2: 200, 5: 200, 10: 150, 20: 150, 50: 150, 100: 100, 200: 100},
    );
  }

  @override
  String toString() {
    return 'CoinCassette(id: $id, coinTubes: $coinTubes, tubesCapacity: $tubesCapacity, fillLevels: $fillLevels, totalAmount: $totalAmount)';
  }
}
