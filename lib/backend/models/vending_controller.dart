import 'package:snackautomat_24/backend/models/nullable_wrapper.dart';
import 'package:snackautomat_24/backend/models/product.dart';
import 'package:snackautomat_24/backend/models/slot.dart';

enum DisplayMessageTypes {
  dmGreeting,
  dmSelectProduct,
  dmInsertCoin,
  dmFarewell,
  dmNoTranslation,
}

class VendingController {
  final String displayMessage;
  final Slot? selectedSlot;
  final int cacheAmount;

  VendingController({
    required this.displayMessage,
    this.selectedSlot,
    required this.cacheAmount,
  });

  VendingController copyWith({
    String? displayMessage,
    Wrapper<Slot?>? selectedSlot,
    int? cacheAmount,
  }) {
    return VendingController(
      displayMessage: displayMessage ?? this.displayMessage,
      selectedSlot: selectedSlot != null ? selectedSlot.value : this.selectedSlot,
      cacheAmount: cacheAmount ?? this.cacheAmount,
    );
  }

  factory VendingController.standard() {
    return VendingController(
      displayMessage: DisplayMessageTypes.dmGreeting.name,
      cacheAmount: 0,
    );
  }

  @override
  String toString() {
    return 'VendingController(displayMessage: $displayMessage, selectedSlot: $selectedSlot, cacheAmount: $cacheAmount)';
  }

  // selectProduct method
  // VendingController selectProduct(Product product) {
  //   return VendingController(
  //     displayMessage: DisplayMessageTypes.dmInsertCoin.name,
  //     selectedSlot: selectedSlot,
  //     cacheAmount: cacheAmount,
  //   );
  // }
}
