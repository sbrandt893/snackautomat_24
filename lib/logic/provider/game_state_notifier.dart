import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/coin.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(GameState(inventory: [Coin.c200(), Coin.c100(), Coin.c50()]));

  void toggleHighlightedTooltips() {
    state = state.copyWith(highlightedTooltips: !state.highlightedTooltips);
  }

  void setCurrentPage(int currentPage) {
    state = state.copyWith(currentPage: currentPage);
  }

  void toggleHammerEquipment() {
    state = state.copyWith(hammerEquipped: !state.hammerEquipped);
  }

  void toggleNewVendingMachineControlPanel() {
    print('toggleCPfromNVM');
    state = state.copyWith(showControlPanelNewVendingMachine: !state.showControlPanelNewVendingMachine);
  }

  void toggleInventoryView() {
    print('toggleInventoryView');
    state = state.copyWith(showInventory: !state.showInventory);
  }
}
