import 'package:flutter/material.dart';
import 'package:snackautomat_24/logic/provider/cursor_state_notifier.dart';

class CursorTypeRouter {
  static Widget getWidgetFromCursorType(CursorTypes cursorType) {
    switch (cursorType) {
      case CursorTypes.none:
        return Image.asset('assets/images/finger_pointer_right.png', width: 30, height: 30);
      case CursorTypes.coin:
        return Image.asset('assets/images/bitcoin.png', width: 30, height: 30);
      case CursorTypes.arrowLeft:
        return Container(
          width: 50,
          height: 50,
          color: Colors.red,
        );
      case CursorTypes.arrowRight:
        return Container(
          width: 50,
          height: 50,
          color: Colors.green,
        );
    }
  }
}
