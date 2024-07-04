import 'package:snackautomat_24/backend/models/slot.dart';

class SlotContainer {
  final int slotRows;
  final int slotColumns;
  final Map<String, Slot> slots;

  SlotContainer({
    required this.slotRows,
    required this.slotColumns,
  }) : slots = _generateSlots(slotRows, slotColumns);

  static Map<String, Slot> _generateSlots(int rows, int columns) {
    final slots = <String, Slot>{};
    const int alphabetSize = 9; // From A to I
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    for (int row = 1; row <= rows; row++) {
      for (int col = 1; col <= columns; col++) {
        String rowLetter = alphabet[(row - 1) % alphabetSize];
        int rowMultiplier = (row - 1) ~/ alphabetSize;
        String slotNumber = '${rowMultiplier > 0 ? rowMultiplier + 1 : ''}$rowLetter$col';

        if (slots.containsKey(slotNumber)) {
          throw Exception('Slot number $slotNumber already exists');
        }
        slots[slotNumber] = Slot(
          slotNumber: slotNumber,
          maxCapacity: 10,
        );
      }
    }
    return slots;
  }

  SlotContainer copyWith({
    int? slotRows,
    int? slotColumns,
  }) {
    return SlotContainer(
      slotRows: slotRows ?? this.slotRows,
      slotColumns: slotColumns ?? this.slotColumns,
    );
  }

  factory SlotContainer.r9c11() {
    return SlotContainer(
      slotRows: 9,
      slotColumns: 11,
    );
  }

  factory SlotContainer.r22c22() {
    return SlotContainer(
      slotRows: 22,
      slotColumns: 22,
    );
  }

  @override
  String toString() {
    return 'SlotContainer(slotRows: $slotRows, slotColumns: $slotColumns, slots: $slots)';
  }
}



//  static Map<String, Slot> _generateSlots(int rows, int columns) {
//     final slots = <String, Slot>{};
//     for (int row = 1; row <= rows; row++) {
//       for (int col = 1; col <= columns; col++) {
//         String slotNumber = '${row * 10}$col';
//         if (slots.containsKey(slotNumber)) {
//           throw Exception('Slot number $slotNumber already exists');
//         }
//         slots[slotNumber] = Slot(
//           slotNumber: slotNumber,
//           maxCapacity: 10,
//         );
//       }
//     }
//     return slots;
//   }