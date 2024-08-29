import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/slot.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/scrolling_text_container.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';
import 'package:snackautomat_24/logic/provider/synced_scroll_controllers.dart';

class Display extends ConsumerWidget {
  final int textControllerId;
  const Display({
    super.key,
    required this.textControllerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    VendingMachine vendingMachine = ref.watch(vendingMachineProvider);
    Slot? selectedSlot = vendingMachine.vendingController.selectedSlot;
    ScrollController textController = ref.watch(syncedScrollControllersProvider)[textControllerId];

    return Container(
      // margin: const EdgeInsets.only(left: 33, right: 33),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        border: Border.all(width: 4, color: Colors.blueGrey.shade700),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Slot: ${selectedSlot?.slotNumber ?? '-'}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.cover,
              child: ScrollingTextContainer(
                controller: textController,
                text: vendingMachine.vendingController.displayMessage,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          selectedSlot?.product != null ? 'Price: ${selectedSlot!.product!.price / 100}€' : 'Price: -',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Paid: ${(vendingMachine.vendingController.cacheAmount / 100).toStringAsFixed(2)}€',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
