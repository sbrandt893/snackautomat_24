import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/frontend/screens/game/game_screen.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class NewVendingMachineExitButton extends StatelessWidget {
  const NewVendingMachineExitButton({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ref.read(gameStateProvider.notifier).setCurrentPage(Pages.uptown.index);
      },
      icon: const Icon(Icons.exit_to_app),
      iconSize: 50,
      color: Colors.blueGrey.shade300,
    );
  }
}
