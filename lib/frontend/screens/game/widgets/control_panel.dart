import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/slot.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/coin_slot_area.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/numpad.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class ControlPanel extends ConsumerWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    VendingMachine vendingMachine = ref.watch(vendingMachineProvider);
    Slot? selectedSlot = vendingMachine.vendingController.selectedSlot;

    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 10),
        height: 777,
        width: 275,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 25, 28, 32), // Frost Black
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 15,
                child: Container(
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
                            text: vendingMachine.vendingController.displayMessage,
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
                ),
              ),
              //? Numpad
              Expanded(
                flex: 75,
                child: FittedBox(
                  // fit: BoxFit.scaleDown,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 133,
                    height: 397,
                    child: const VendingMachineNumpad(
                      width: 100,
                      height: 275,
                      // onProductSelect: (String slotNumber) {},
                      // onConfirm: () {},
                      // onCancel: () {},
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const CoinSlotArea(size: 55),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
