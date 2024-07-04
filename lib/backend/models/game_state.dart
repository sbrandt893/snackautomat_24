import 'package:snackautomat_24/logic/provider/cursor_state_notifier.dart';

class GameState {
  final bool highlightedTooltips;
  final CursorTypes cursorType;

  getCursotType() {
    return cursorType;
  }

  GameState({this.highlightedTooltips = false, this.cursorType = CursorTypes.none});

  GameState copyWith({bool? highlightedTooltips, CursorTypes? cursorType}) {
    return GameState(
      highlightedTooltips: highlightedTooltips ?? this.highlightedTooltips,
      cursorType: cursorType ?? this.cursorType,
    );
  }

  @override
  String toString() {
    return 'GameState(highlightedTooltips: $highlightedTooltips, cursor: $cursorType)';
  }
}
