import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/interfaces/translation/i_translation.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';
import 'package:snackautomat_24/backend/models/vending_controller.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/control_panel.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/inventory.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/new_vending_machine.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/new_vending_machine_exit_button.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class NewVendingMachineCloseup extends ConsumerStatefulWidget {
  const NewVendingMachineCloseup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewVendingMachineCloseupState();
}

class _NewVendingMachineCloseupState extends ConsumerState<NewVendingMachineCloseup> {
  bool showControlPanel = false;

  @override
  Widget build(BuildContext context) {
    GameState gameState = ref.watch(gameStateProvider);
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

          //? vending machine case
          const Positioned.fill(
            child: Center(
              child: AspectRatio(
                aspectRatio: 3 / 5,
                child: Padding(
                  padding: EdgeInsets.all(33),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [NewVendingMachine(textControllerId: 1)],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 15,
            right: 15,
            child: NewVendingMachineExitButton(ref: ref),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: GestureDetector(
              onDoubleTap: () {
                ref.read(gameStateProvider.notifier).toggleHammerEquipment();
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: gameState.hammerEquipped ? Colors.amber.withOpacity(0.5) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/hammer.png'), // Stellen Sie sicher, dass dieses Bild existiert
              ),
            ),
          ),
          Positioned.fill(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (gameState.showInventory)
                const Expanded(
                  child: InventoryContainer(),
                ),
              if (gameState.showControlPanelNewVendingMachine)
                const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 33),
                  child: ControlPanel(
                    textControllerId: 2,
                  ),
                ))
            ],
          ))
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
