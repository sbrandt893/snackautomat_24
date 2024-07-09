import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';
import 'package:snackautomat_24/frontend/screens/game/pages/downtown.dart';
import 'package:snackautomat_24/frontend/screens/game/pages/new_vending_machine_closeup.dart';
import 'package:snackautomat_24/frontend/screens/game/pages/uptown.dart';
import 'package:snackautomat_24/frontend/screens/game/widgets/custom_bottom_appbar.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

enum Pages {
  uptown,
  downtown,
  newVendingMachineCloseup,
}

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<GameScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: ref.read(gameStateProvider).currentPage);
  }

  @override
  Widget build(BuildContext context) {
    GameState gameState = ref.watch(gameStateProvider);

    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          AnimatedSwitcher(
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              duration: const Duration(milliseconds: 500),
              child: _getPageFromIndex(gameState.currentPage)),
        ],
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

// get page from page index

Widget _getPageFromIndex(int index) {
  switch (Pages.values[index]) {
    case Pages.uptown:
      return const Uptown();
    case Pages.downtown:
      return const Downtown();
    case Pages.newVendingMachineCloseup:
      return const NewVendingMachineCloseup();
    default:
      return const Uptown();
  }
}
