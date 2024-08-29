import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snackautomat_24/backend/models/coin.dart';

class InventoryContainer extends StatefulWidget {
  const InventoryContainer({super.key});

  @override
  _InventoryContainerState createState() => _InventoryContainerState();
}

class _InventoryContainerState extends State<InventoryContainer> {
  List<Coin> coins = [
    Coin.c200(),
    Coin.c100(),
    Coin.c50(),
    Coin.c20(),
    Coin.c10(),
    Coin.c5(),
    Coin.c2(),
    Coin.c1(),
  ];

  List<CoinWidget> _inventoryCoins = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _generateItems();
  }

  void _generateItems() {
    _inventoryCoins = coins
        .map(
          (coin) => CoinWidget(
            coin: coin,
            color: getCoinColor(coin),
            position: Offset(
              Random().nextDouble() * 300,
              Random().nextDouble() * 300,
            ),
            zIndex: 0,
            isDragged: false,
          ),
        )
        .toList();
  }

  CoinWidget? _draggedItem;
  final Offset _draggedItemOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (final coinWidget in _inventoryCoins)
          Positioned(
            left: coinWidget.position.dx - 20,
            top: coinWidget.position.dy - 20,
            width: coinWidget.coin.diameter * 3,
            height: coinWidget.coin.diameter * 3,
            child: Draggable<CoinWidget>(
              data: coinWidget,
              feedback: CoinWidget(
                coin: coinWidget.coin,
                color: coinWidget.color,
                position: coinWidget.position,
                zIndex: 0,
                isDragged: true,
              ),
              childWhenDragging: Container(),
              onDragStarted: () {
                setState(() {
                  _draggedItem = coinWidget;
                });
              },
              onDragEnd: (details) {
                setState(() {
                  if (_draggedItem != null) {
                    _draggedItem!.position = details.offset + _draggedItemOffset;
                    _inventoryCoins.forEach((element) {
                      element.zIndex = 0;
                    });
                    _draggedItem!.zIndex = _inventoryCoins.length;
                    _inventoryCoins.sort((a, b) => a.zIndex.compareTo(b.zIndex));
                  }
                  _draggedItem = null;
                });
              },
              child: CoinWidget(
                coin: coinWidget.coin,
                color: coinWidget.color,
                position: coinWidget.position,
                zIndex: coinWidget.zIndex,
                isDragged: false,
              ),
            ),
          ),
      ],
    );
  }
}

class CoinWidget extends StatelessWidget {
  CoinWidget({
    super.key,
    required this.coin,
    required this.color,
    required this.position,
    required this.zIndex,
    required this.isDragged,
  });
  final Coin coin;
  final Color color;
  Offset position;
  int zIndex;
  bool isDragged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: coin.diameter * 3.5,
      width: coin.diameter * 3.5,
      decoration: BoxDecoration(
        color: color,
        border: isDragged ? Border.all(color: Colors.white, width: 2) : null,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          coin.label,
          style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}

getCoinColor(Coin coin) {
  switch (coin.value) {
    case 200:
    case 100:
      return Color(0xFFB5B6B5);
    case 50:
    case 20:
    case 10:
      return Color(0xFFD7BE69);
    case 5:
    case 2:
    case 1:
      // return Color copper in hex
      return Color(0xFFAD6F69);
    default:
      return Colors.grey;
  }
}

// class CoinWidget {
//   final Coin coin;
//   final Color color;
//   Offset position;
//   int zIndex;

//   CoinWidget({
//     required this.coin,
//     required this.color,
//     required this.position,
//     required this.zIndex,
//   });
// }
