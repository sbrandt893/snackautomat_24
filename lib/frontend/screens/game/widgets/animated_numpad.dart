import 'package:flutter/material.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/numpad.dart';

class AnimatedNumpad extends StatefulWidget {
  final double vendingMachineHeight;
  final double vendingMachineWidth;

  const AnimatedNumpad({
    super.key,
    required this.vendingMachineHeight,
    required this.vendingMachineWidth,
  });

  @override
  AnimatedNumpadState createState() => AnimatedNumpadState();
}

class AnimatedNumpadState extends State<AnimatedNumpad> {
  void _showExpandedNumpad() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                margin: const EdgeInsets.all(10),
                height: widget.vendingMachineHeight * 0.5,
                width: widget.vendingMachineHeight * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade300,
                  border: Border.all(width: 2, color: Colors.blueGrey.shade600),
                ),
                child: Stack(
                  children: [
                    VendingMachineNumpad(
                      onProductSelect: (String slotNumber) {
                        print('selected Slot: $slotNumber');
                      },
                      onConfirm: () {
                        print('Confirm');
                      },
                      onCancel: () {
                        print('Cancel');
                      },
                    ),
                  ],
                ),
              );

              //! old code
              //   // Berechnen Sie die Größe basierend auf dem ursprünglichen Verhältnis
              //   double originalRatio = 1.5; // Anpassen Sie diesen Wert, um das gewünschte Verhältnis zu erhalten
              //   double dialogWidth = constraints.maxWidth * 0.7; // 70% der Bildschirmbreite
              //   double dialogHeight = dialogWidth * originalRatio;

              //   // Stellen Sie sicher, dass der Dialog nicht zu groß wird
              //   if (dialogHeight > constraints.maxHeight * 0.8) {
              //     dialogHeight = constraints.maxHeight * 0.8;
              //     dialogWidth = dialogHeight / originalRatio;
              //   }

              //   return Container(
              //     width: dialogWidth,
              //     height: dialogHeight,
              //     decoration: BoxDecoration(
              //       color: Colors.blueGrey.shade300,
              //       border: Border.all(width: 2, color: Colors.blueGrey.shade600),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: VendingMachineNumpad(
              //       onProductSelect: (String slotNumber) {
              //         print('selected Slot: $slotNumber');
              //       },
              //       onConfirm: () {
              //         print('Confirm');
              //         Navigator.of(context).pop();
              //       },
              //       onCancel: () {
              //         print('Cancel');
              //         Navigator.of(context).pop();
              //       },
              //     ),
              //   );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showExpandedNumpad,
      child: Container(
        margin: const EdgeInsets.all(10),
        height: widget.vendingMachineHeight * 0.2,
        width: widget.vendingMachineWidth,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade300,
          border: Border.all(width: 2, color: Colors.blueGrey.shade600),
        ),
        child: Stack(
          children: [
            VendingMachineNumpad(
              onProductSelect: (String slotNumber) {
                print('selected Slot: $slotNumber');
              },
              onConfirm: () {
                print('Confirm');
              },
              onCancel: () {
                print('Cancel');
              },
            ),
            Container(
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
