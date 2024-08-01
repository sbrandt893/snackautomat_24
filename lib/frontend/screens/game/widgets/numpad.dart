import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class VendingMachineNumpad extends ConsumerStatefulWidget {
  final double height;
  final double width;
  // final Function(String) onProductSelect;
  // final VoidCallback onConfirm;
  // final VoidCallback onCancel;

  const VendingMachineNumpad({
    super.key,
    // required this.onProductSelect,
    // required this.onConfirm,
    // required this.onCancel,
    required this.height,
    required this.width,
  });

  @override
  VendingMachineNumpadState createState() => VendingMachineNumpadState();
}

class VendingMachineNumpadState extends ConsumerState<VendingMachineNumpad> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onInput(String value) {
    setState(() {
      if (_controller.text.length < 3) {
        _controller.text += value;
        if (_controller.text.length >= 2) {
          ref.read(vendingMachineProvider.notifier).selectSlot(slotNumber: _controller.text);
        }
      }
    });
  }

  void _onDelete() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
        ref.read(vendingMachineProvider.notifier).selectSlot(slotNumber: _controller.text);
      });
    }
  }

  Future<void> _onCancel() async {
    setState(() {
      _controller.clear();
      ref.read(vendingMachineProvider.notifier).cancelTransaction();
    });
    await Future.delayed(const Duration(milliseconds: 2500));
    setState(() {
      ref.read(vendingMachineProvider.notifier).resetControlPanel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade400,
        border: Border.all(width: 2, color: Colors.blueGrey.shade700),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //? Input field
          Expanded(
            flex: 10,
            child: FittedBox(
              child: Container(
                padding: const EdgeInsets.all(3),
                width: widget.width * 0.7,
                height: widget.height * 0.1,
                child: TextField(
                  controller: _controller,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: widget.height * 0.05),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    contentPadding: const EdgeInsets.all(3),
                  ),
                ),
              ),
            ),
          ),
          //? Numpad
          Expanded(
            flex: 90,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: const EdgeInsets.all(5),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: [
                ...'ABCDEFGHI'.split('').map((label) => _buildButton(label: label)),
                ...'123456789'.split('').map((label) => _buildButton(label: label)),
                _buildButton(label: '0'),
                _buildButton(label: 'DEL', color: Colors.orange),
                _buildButton(label: 'OK', color: Colors.green),
                const SizedBox(),
                const SizedBox(),
                _buildButton(label: 'CAN', color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({required String label, Color? color}) {
    VoidCallback onPressed;

    switch (label) {
      case 'DEL':
        onPressed = _onDelete;
        break;
      case 'OK':
        onPressed = () {};
        break;
      case 'CAN':
        onPressed = _onCancel;
        break;
      default:
        onPressed = () => _onInput(label);
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.blueGrey.shade500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.zero,
      ),
      child: FittedBox(
        child: Text(label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            )),
      ),
    );
  }
}
