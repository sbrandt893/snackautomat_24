import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/inventory.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class CoinSlotArea extends ConsumerWidget {
  final double size;
  const CoinSlotArea({super.key, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.blueGrey.shade700, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: FittedBox(
              child: InkWell(
                onTap: () {
                  // Add logic to pay back money
                },
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    border: Border.all(
                      color: Colors.blueGrey.shade700,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: FittedBox(
              child: InkWell(
                onTap: () {
                  ref.read(gameStateProvider.notifier).toggleInventoryView();
                  // showDialog(
                  //   context: context,
                  //   builder: (context) => Container(
                  //     padding: const EdgeInsets.all(20),
                  //     child: InventoryContainer(),
                  //   ),
                  // );
                },
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    border: Border.all(
                      color: Colors.blueGrey.shade700,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      '( )',
                      style: TextStyle(
                        height: -0.3,
                        fontSize: size * 0.7,
                        color: Colors.blueGrey.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
