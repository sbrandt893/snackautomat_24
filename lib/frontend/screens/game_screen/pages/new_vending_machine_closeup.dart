import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/interfaces/translation/i_translation.dart';
import 'package:snackautomat_24/backend/models/app_settings.dart';
import 'package:snackautomat_24/backend/models/vending_controller.dart';
import 'package:snackautomat_24/backend/models/vending_machine.dart';
import 'package:snackautomat_24/frontend/screens/game_screen/widgets/new_vending_machine_exit_button.dart';
import 'package:snackautomat_24/frontend/screens/game_screen/widgets/scrolling_text_container.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class NewVendingMachineCloseup extends ConsumerStatefulWidget {
  const NewVendingMachineCloseup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewVendingMachineCloseupState();
}

class _NewVendingMachineCloseupState extends ConsumerState<NewVendingMachineCloseup> {
  @override
  Widget build(BuildContext context) {
    VendingMachine vendingMachine = ref.watch(vendingMachineProvider);
    AppSettings appSettings = ref.watch(appSettingsProvider);
    String displayMessageTranslated = getTranslation(displayMessage: vendingMachine.vendingController.displayMessage, translation: appSettings.translation);

    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.asset(
                'assets/images/backgrounds/uptown.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              // double maxHandyWidth = 1440;
              // double maxHandyHeight = 3200;
              // bool isLargeScreen = constraints.maxWidth > maxHandyWidth || constraints.maxHeight > maxHandyHeight;

              double vendingMachineWidth = constraints.maxWidth * 0.97;
              double vendingMachineHeight = constraints.maxHeight * 0.98;

              if (vendingMachineWidth / vendingMachineHeight > 3 / 5) {
                vendingMachineWidth = vendingMachineHeight * 3 / 5;
              } else {
                vendingMachineHeight = vendingMachineWidth * 5 / 3;
              }

              return
                  //? vending machine case
                  Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: (constraints.maxWidth - vendingMachineWidth) / 2,
                    top: (constraints.maxHeight - vendingMachineHeight) / 2,
                    child: SizedBox(
                      width: vendingMachineWidth,
                      height: vendingMachineHeight,
                      child: AspectRatio(
                        aspectRatio: 3 / 5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 205, 213, 224), // Chrysler Platinum Silver
                              border: Border.all(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          //? left and right side
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              //? left side with slot container and product dispenser
                              Flexible(
                                flex: 7,
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 7,
                                      //? slot container
                                      child: Container(
                                        margin: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 205, 213, 224), // Chrysler Platinum Silver
                                          border: Border.all(
                                            width: 2,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            //? slot container products
                                            GridView.count(
                                              crossAxisCount: 8,
                                              children: List.generate(
                                                48,
                                                (index) => Container(
                                                  margin: const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromARGB(255, 205, 213, 224), // Chrysler Platinum Silver
                                                    border: Border.all(
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Image.asset('assets/images/products/wonka_bar.png'),
                                                ),
                                              ),
                                            ),
                                            //? glass pane
                                            Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue.withOpacity(0.2),
                                                    border: Border.all(
                                                      width: 2,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    // make an gradiant which looks like a glass pane where the sun shines on
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 25, 28, 32), // Frost Black
                                          border: Border(
                                            top: BorderSide(width: 2),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(17),
                                          ),
                                        ),
                                        child: Center(
                                          //? product dispenser
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            width: vendingMachineWidth * 0.5,
                                            height: vendingMachineHeight * 0.1,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 205, 213, 224), // Chrysler Platinum Silver
                                              border: Border.all(width: 2),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //? right side with display, numpad and coin slot
                              Flexible(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 25, 28, 32), // Frost Black
                                          border: Border(
                                            left: BorderSide(width: 2),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(17),
                                            bottomRight: Radius.circular(17),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: vendingMachineHeight * 0.15,
                                            ),
                                            Flexible(
                                              child: Container(
                                                margin: const EdgeInsets.all(10),
                                                height: vendingMachineHeight * 0.07,
                                                width: vendingMachineWidth,
                                                decoration: BoxDecoration(
                                                  color: Colors.green.shade200, // Chrysler Platinum Silver
                                                  border: Border.all(width: 2, color: Colors.blueGrey.shade700),
                                                ),
                                                child: FittedBox(
                                                  child: ScrollingTextContainer(
                                                    text: displayMessageTranslated,
                                                    // text: 'Dies ist ein unglaublich laaanger Text :D',
                                                    duration: const Duration(seconds: 5), // Geschwindigkeit anpassen
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                margin: const EdgeInsets.all(10),
                                                height: vendingMachineHeight * 0.2,
                                                width: vendingMachineWidth,
                                                decoration: BoxDecoration(
                                                  color: Colors.blueGrey.shade300,
                                                  border: Border.all(width: 2, color: Colors.blueGrey.shade600),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: NewVendingMachineExitButton(ref: ref),
          ),
        ],
      ),
    );
  }

  String getTranslation({required String displayMessage, required ITranslation translation}) {
    switch (DisplayMessageTypes.values.firstWhere((dmType) => dmType.name == displayMessage)) {
      case DisplayMessageTypes.dmGreeting:
        return translation.dmGreeting;
      default:
        return translation.noTranslation;
    }
  }
}
