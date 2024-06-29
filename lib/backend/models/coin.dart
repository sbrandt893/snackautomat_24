import 'package:uuid/uuid.dart';

class Coin {
  final String id;
  final String label;
  final int value;
  final double diameter;
  final double thickness;
  final double weight;

  Coin({
    required this.id,
    required this.label,
    required this.value,
    required this.diameter,
    required this.thickness,
    required this.weight,
  });

  Coin copyWith({
    String? id,
    String? label,
    int? value,
    double? diameter,
    double? thickness,
    double? weight,
  }) {
    return Coin(
      id: id ?? this.id,
      label: label ?? this.label,
      value: value ?? this.value,
      diameter: diameter ?? this.diameter,
      thickness: thickness ?? this.thickness,
      weight: weight ?? this.weight,
    );
  }

  factory Coin.fromDenomination(int denomination) {
    switch (denomination) {
      case 1:
        return Coin.c1();
      case 2:
        return Coin.c2();
      case 5:
        return Coin.c5();
      case 10:
        return Coin.c10();
      case 20:
        return Coin.c20();
      case 50:
        return Coin.c50();
      case 100:
        return Coin.c100();
      case 200:
        return Coin.c200();
      default:
        throw Exception('Unsupported coin denomination: $denomination');
    }
  }

  factory Coin.c1() {
    return Coin(
      id: const Uuid().v4(),
      label: '1 Cent',
      value: 1,
      diameter: 16.25,
      thickness: 1.67,
      weight: 2.30,
    );
  }

  factory Coin.c2() {
    return Coin(
      id: const Uuid().v4(),
      label: '2 Cent',
      value: 2,
      diameter: 18.75,
      thickness: 1.67,
      weight: 3.06,
    );
  }

  factory Coin.c5() {
    return Coin(
      id: const Uuid().v4(),
      label: '5 Cent',
      value: 5,
      diameter: 21.25,
      thickness: 1.67,
      weight: 3.92,
    );
  }

  factory Coin.c10() {
    return Coin(
      id: const Uuid().v4(),
      label: '10 Cent',
      value: 10,
      diameter: 19.75,
      thickness: 1.93,
      weight: 4.10,
    );
  }

  factory Coin.c20() {
    return Coin(
      id: const Uuid().v4(),
      label: '20 Cent',
      value: 20,
      diameter: 22.25,
      thickness: 2.14,
      weight: 5.74,
    );
  }

  factory Coin.c50() {
    return Coin(
      id: const Uuid().v4(),
      label: '50 Cent',
      value: 50,
      diameter: 24.25,
      thickness: 2.38,
      weight: 7.80,
    );
  }

  factory Coin.c100() {
    return Coin(
      id: const Uuid().v4(),
      label: '1 Euro',
      value: 100,
      diameter: 23.25,
      thickness: 2.33,
      weight: 7.50,
    );
  }

  factory Coin.c200() {
    return Coin(
      id: const Uuid().v4(),
      label: '2 Euro',
      value: 200,
      diameter: 25.75,
      thickness: 2.20,
      weight: 8.50,
    );
  }

  @override
  String toString() {
    return 'Coin(id: $id, label: $label, value: $value, diameter: $diameter, thickness: $thickness, weight: $weight)';
  }
}
