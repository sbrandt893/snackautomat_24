import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(GameState());

  void toggleHighlightedTooltips() {
    state = state.copyWith(highlightedTooltips: !state.highlightedTooltips);
  }

  void setCurrentPage(int currentPage) {
    state = state.copyWith(currentPage: currentPage);
  }
}
