import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/frontend/widgets/custom_bottom_appbar_button.dart';

class CustomBottomAppBar extends ConsumerWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      height: 50,
      color: Colors.grey[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomAppBarButton(
            icon: Icons.explore_outlined,
            backgroundColor: Colors.blueGrey,
            label: 'Map',
            onPressed: () {},
          ),
          CustomAppBarButton(
            icon: Icons.night_shelter_outlined,
            backgroundColor: Colors.blueGrey,
            label: 'Sleeping',
            onPressed: () {},
          ),
          CustomAppBarButton(
            icon: Icons.backpack_outlined,
            backgroundColor: Colors.blueGrey,
            label: 'Inventory',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
