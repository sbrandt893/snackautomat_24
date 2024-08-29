import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';
import 'package:snackautomat_24/backend/models/product.dart';
import 'package:snackautomat_24/backend/models/slot.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/broken_glass_pane.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/control_panel.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/slot_spirals.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class NewVendingMachine extends ConsumerStatefulWidget {
  final bool smallView;
  final int textControllerId;
  const NewVendingMachine({
    super.key,
    this.smallView = false,
    required this.textControllerId,
  });

  @override
  ConsumerState<NewVendingMachine> createState() => _NewVendingMachineState();
}

class _NewVendingMachineState extends ConsumerState<NewVendingMachine> {
  @override
  Widget build(BuildContext context) {
    GameState gameState = ref.watch(gameStateProvider);
    VendingMachine vendingMachine = ref.watch(vendingMachineProvider);
    final slots = vendingMachine.slotContainer.slots;
    final rowKeys = slots.keys.map((k) => k[0]).toSet().toList()..sort();
    final colNumbers = slots.keys.map((k) => int.parse(k.substring(1))).toSet().toList()..sort();
    double vendingMachineWidth = MediaQuery.of(context).size.width * 0.8;
    double vendingMachineHeight = vendingMachineWidth * 5 / 3;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 205, 213, 224), // Chrysler Platinum Silver
          border: Border.all(
            width: 1.5,
          ),
          borderRadius: widget.smallView ? BorderRadius.circular(7) : BorderRadius.circular(14)),
      //? left and right side
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //? left side with slot container and product dispenser
          Expanded(
            flex: 80,
            child: Column(
              children: [
                Expanded(
                  flex: 80,
                  //? slot container
                  child: Container(
                    margin: EdgeInsets.all(widget.smallView ? 3.3 : 7.7),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 205, 213, 224), // Chrysler Platinum Silver
                      border: Border.all(
                        width: widget.smallView ? 0.1 : 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        //? slot container products
                        Column(
                          children: rowKeys.map((rowKey) {
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
                                  children: colNumbers.map((colNumber) {
                                    String slotKey = '$rowKey$colNumber';
                                    Slot? slot = slots[slotKey];

                                    if (slot == null) return Expanded(child: Container());

                                    Product? product = slot.product;

                                    return Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          if (product != null) {
                                            // ref.read(vendingMachineProvider.notifier).addProduct(slotKey, product);
                                            ref.read(vendingMachineProvider.notifier).removeProduct(slotKey);
                                          }
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Align(
                                                  alignment: AlignmentDirectional.bottomCenter,
                                                  child: Stack(
                                                    alignment: AlignmentDirectional.bottomCenter,
                                                    children: [
                                                      product != null ? Image.asset(product.image) : Container(color: Colors.transparent), // Leerer Slot
                                                      Padding(
                                                        padding: EdgeInsets.only(bottom: widget.smallView ? vendingMachineHeight * 0.005 : vendingMachineHeight * 0.02),
                                                        child: Spiral(
                                                          // width: vendingMachineWidth * 0.085,
                                                          width: widget.smallView ? vendingMachineWidth * 0.02 : vendingMachineWidth * 0.085,
                                                          height: widget.smallView ? vendingMachineHeight * 0.02 : vendingMachineHeight * 0.085,
                                                          color: const Color.fromARGB(255, 25, 28, 32),
                                                          isLeftFacing: colNumber % 2 == 0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Color.fromARGB(255, 25, 28, 32), // Frost Black
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          decoration: const BoxDecoration(
                                                            color: Color.fromARGB(255, 25, 28, 32), // Frost Black
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: const Color.fromARGB(255, 25, 28, 32), // Frost Black
                                                                    border: Border.all(
                                                                      color: Colors.white.withOpacity(0.3), // Dünner weißer Rahmen mit leichter Transparenz
                                                                      width: 0.5, // Sehr dünne Linie
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child: Container(
                                                                          decoration: const BoxDecoration(
                                                                            color: Color.fromARGB(255, 25, 28, 32), // Frost Black
                                                                          ),
                                                                          child: Center(
                                                                            child: FittedBox(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.only(left: 3),
                                                                                child: Text(
                                                                                  slotKey,
                                                                                  style: const TextStyle(
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child: Container(
                                                                          decoration: const BoxDecoration(
                                                                            color: Color.fromARGB(255, 25, 28, 32), // Frost Black
                                                                          ),
                                                                          child: Center(
                                                                            child: FittedBox(
                                                                              child: Text(
                                                                                product != null ? '${(product.price / 100).toStringAsFixed(2)}€' : '-',
                                                                                style: const TextStyle(
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        //? glass pane
                        if (vendingMachine.glassPane != null && vendingMachine.glassPane!.actualHealthPoints > 0)
                          GestureDetector(
                            onTapDown: (TapDownDetails details) {
                              print('TAP DOWN');
                              if (gameState.hammerEquipped) {
                                print('HAMMER HIT');
                                ref.read(vendingMachineProvider.notifier).damageGlassPane(damageAmount: 10);
                                ref.read(vendingMachineProvider.notifier).addCrackToGlassPane(crack: details.localPosition);
                              }
                            },
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.3),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.white.withOpacity(0.2),
                                        Colors.white.withOpacity(0.2),
                                        Colors.white.withOpacity(0.5),
                                        Colors.blueGrey.withOpacity(0.2),
                                        Colors.blueGrey.withOpacity(0.2),
                                      ],
                                      stops: const [0.1, 0.2, 0.3, 0.8, 0.9],
                                    ),
                                    border: Border.all(
                                      width: 2,
                                    ),
                                  ),
                                ),
                                if (vendingMachine.glassPane!.cracks.isNotEmpty)
                                  ...vendingMachine.glassPane!.cracks.map((crackPosition) => Positioned(
                                        left: crackPosition.dx - (vendingMachineWidth * 0.15),
                                        top: crackPosition.dy - (vendingMachineHeight * 0.15),
                                        child: Image.asset(
                                          'assets/images/crack.png',
                                          width: vendingMachineWidth * 0.3,
                                          height: vendingMachineHeight * 0.3,
                                        ),
                                      )),
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Text(
                                    'Health: ${vendingMachine.glassPane!.actualHealthPoints}',
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (vendingMachine.glassPane != null && vendingMachine.glassPane!.actualHealthPoints <= 0)
                          Padding(
                              padding: const EdgeInsets.all(0),
                              child: IgnorePointer(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                    ),
                                  ),
                                  child: BrokenGlassPane(
                                    height: vendingMachineHeight,
                                    width: vendingMachineWidth,
                                  ),
                                ),
                              ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 25, 28, 32), // Frost Black
                      border: const Border(
                        top: BorderSide(width: 2),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(widget.smallView ? 5 : 12),
                      ),
                    ),
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          heightFactor: 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 205, 213, 224), // Chrysler Platinum Silver
                              border: Border.all(width: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //? right side with display, numpad and coin slot
          Expanded(
            flex: 20,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 25, 28, 32), // Frost Black
                border: const Border(
                  left: BorderSide(width: 2),
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(widget.smallView ? 5 : 12),
                  bottomRight: Radius.circular(widget.smallView ? 5 : 12),
                ),
              ),
              child: Column(
                children: [
                  //? placeholder
                  const Expanded(
                    flex: 20,
                    child: SizedBox(),
                  ),
                  //? control panel
                  Expanded(
                    flex: 40,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ControlPanel(
                          textControllerId: widget.textControllerId,
                        ),
                        screenWidth > 800
                            ? Container()
                            : Container(
                                color: Colors.blue.withOpacity(0.0),
                                child: GestureDetector(
                                  onTap: () {
                                    ref.read(gameStateProvider.notifier).toggleNewVendingMachineControlPanel();
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (context) {
                                    //     return Dialog(
                                    //       alignment: Alignment.centerLeft,
                                    //       insetPadding: EdgeInsets.only(left: screenWidth / 2, right: 20, top: 42, bottom: 90),
                                    //       backgroundColor: Colors.transparent,
                                    //       child: const ControlPanel(),
                                    //     );
                                    //   },
                                    // );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),

                  //? placeholder
                  const Expanded(
                    flex: 40,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
