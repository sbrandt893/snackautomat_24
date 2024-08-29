import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/slot.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/coin_slot_area.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/display.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/numpad.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class ControlPanel extends ConsumerWidget {
  final int textControllerId;

  const ControlPanel({
    super.key,
    required this.textControllerId,
  });

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
              //? Display
              Expanded(
                flex: 15,
                child: Display(textControllerId: textControllerId),
              ),
              //? Numpad
              Expanded(
                flex: 75,
                child: FittedBox(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: 133,
                    height: 397,
                    child: const VendingMachineNumpad(
                      width: 100,
                      height: 275,
                    ),
                  ),
                ),
              ),
              //? Coin Slot Area
              const Expanded(
                flex: 10,
                child: CoinSlotArea(size: 55),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
