import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';
import 'package:snackautomat_24/logic/provider/cursor_state_notifier.dart';

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(GameState());

  void toggleHighlightedTooltips() {
    state = state.copyWith(highlightedTooltips: !state.highlightedTooltips);
    print(state.highlightedTooltips);
  }

  void setCursor(CursorTypes cursorType) {
    state = state.copyWith(cursorType: cursorType);
  }
}
