import 'package:snackautomat_24/backend/data/predefined_products.dart';
import 'package:snackautomat_24/backend/models/product.dart';
import 'package:snackautomat_24/backend/models/slot.dart';

class SlotContainer {
  final int slotRows;
  final int slotCols;
  final Map<String, Slot> slots;

  SlotContainer({
    required this.slotRows,
    required this.slotCols,
  }) : slots = _generateSlots(slotRows, slotCols);

  static Map<String, Slot> _generateSlots(int rows, int columns) {
    final slots = <String, Slot>{};
    const int alphabetSize = 26; // From A to Z
    const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    for (int row = 0; row < rows; row++) {
      for (int col = 1; col <= columns; col++) {
        String rowLetter = alphabet[row % alphabetSize];
        int rowMultiplier = row ~/ alphabetSize;
        String slotNumber = '${rowMultiplier > 0 ? rowMultiplier + 1 : ''}$rowLetter$col';

        if (slots.containsKey(slotNumber)) {
          throw Exception('Slot number $slotNumber already exists');
        }
        slots[slotNumber] = Slot(
          slotNumber: slotNumber,
          maxCapacity: 10,
          productQuantity: 0,
        );
      }
    }
    return slots;
  }

  SlotContainer copyWith({
    Map<String, Slot>? slots,
  }) {
    return SlotContainer._internal(
      slotRows: slotRows,
      slotCols: slotCols,
      slots: slots ?? this.slots.map((key, value) => MapEntry(key, value.copyWith())),
    );
  }

  // Private constructor for copyWith
  SlotContainer._internal({
    required this.slotRows,
    required this.slotCols,
    required this.slots,
  });

  factory SlotContainer.r6c6() {
    final slotContainer = SlotContainer(slotRows: 6, slotCols: 6);

    // Erstellen Sie eine Liste von 36 Produkten, indem Sie die predefinedProducts-Liste wiederholen
    final products = List.generate(36, (index) => predefinedProducts[index % predefinedProducts.length]);

    // Füllen Sie die Slots mit den Produkten
    return slotContainer.fillSlots(products);
  }

  factory SlotContainer.r6c8() {
    return SlotContainer(slotRows: 6, slotCols: 8);
  }

  factory SlotContainer.r9c9() {
    return SlotContainer(slotRows: 9, slotCols: 9);
  }

  factory SlotContainer.r9c11() {
    return SlotContainer(slotRows: 9, slotCols: 11);
  }

  // Method to prefill all slots with the products from a list (List<Product>) with a quantity equal to the maxCapacity
  SlotContainer fillSlots(List<Product> products) {
    final slots = <String, Slot>{};
    int productIndex = 0;

    for (final slot in this.slots.values) {
      if (productIndex >= products.length) {
        break;
      }

      Slot updatedSlot = slot;
      for (int i = 0; i < slot.maxCapacity; i++) {
        updatedSlot = updatedSlot.addProduct(product: products[productIndex]);
      }

      slots[slot.slotNumber] = updatedSlot;
      productIndex++;
    }

    return copyWith(slots: slots);
  }

  @override
  String toString() {
    return 'SlotContainer(slotRows: $slotRows, slotColumns: $slotCols, slots: $slots)';
  }
}
