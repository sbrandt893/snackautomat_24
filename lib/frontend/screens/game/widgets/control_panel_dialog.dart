import 'package:flutter/material.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/coin_slot_area.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/numpad.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/scrolling_text_container.dart';

class ControlPanelDialog extends StatelessWidget {
  const ControlPanelDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      alignment: Alignment.centerLeft,
      insetPadding: EdgeInsets.only(left: screenWidth / 2, right: 20, top: 42, bottom: 90),
      backgroundColor: Colors.transparent,
      child: FittedBox(
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
              children: [
                Expanded(
                  flex: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      border: Border.all(width: 4, color: Colors.blueGrey.shade700),
                    ),
                    child: const FittedBox(
                      child: ScrollingTextContainer(
                        text: 'displayMessageTranslated',
                      ),
                    ),
                  ),
                ),
                //? Numpad
                Expanded(
                  flex: 75,
                  child: FittedBox(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      width: 133,
                      height: 397,
                      child: VendingMachineNumpad(
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
      ),
    );
  }
}
