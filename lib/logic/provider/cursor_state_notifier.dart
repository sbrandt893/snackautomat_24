import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CursorTypes {
  none,
  coin,
  arrowLeft,
  arrowRight,
}

final cursorStateProvider = StateNotifierProvider<CursorStateNotifier, CursorTypes>((ref) {
  return CursorStateNotifier();
});

class CursorStateNotifier extends StateNotifier<CursorTypes> {
  CursorStateNotifier() : super(CursorTypes.none);

  void setCursorType(CursorTypes cursorType) {
    state = cursorType;
  }

  void resetCursorType() {
    state = CursorTypes.none;
  }
}
