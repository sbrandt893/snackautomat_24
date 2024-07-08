import 'package:flutter/material.dart';

class VendingMachineNumpad extends StatefulWidget {
  final Function(String) onProductSelect;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const VendingMachineNumpad({
    super.key,
    required this.onProductSelect,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  VendingMachineNumpadState createState() => VendingMachineNumpadState();
}

class VendingMachineNumpadState extends State<VendingMachineNumpad> {
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
          widget.onProductSelect(_controller.text);
        }
      }
    });
  }

  void _onDelete() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      });
    }
  }

  void _onCancel() {
    setState(() {
      _controller.clear();
    });
    widget.onCancel();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.blueGrey.shade300,
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.09,
                child: TextField(
                  controller: _controller,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: constraints.maxHeight * 0.05,
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    contentPadding: const EdgeInsets.all(3),
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.01),
              Flexible(
                // flex: 6,
                child: Column(
                  children: [
                    ...[
                      ['A', 'B', 'C'],
                      ['D', 'E', 'F'],
                      ['G', 'H', 'I'],
                      ['1', '2', '3'],
                      ['4', '5', '6'],
                      ['7', '8', '9'],
                      ['0', 'DEL', 'OK'],
                    ].map((row) => Expanded(child: _buildRow(row, constraints))),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: Container()), // Leerer Platzhalter
                          Expanded(child: Container()), // Leerer Platzhalter
                          Expanded(child: _buildButton(label: 'CAN', constraints: constraints)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRow(List<String> buttons, BoxConstraints constraints) {
    return Row(
      children: buttons.map((button) => Expanded(child: _buildButton(label: button, constraints: constraints))).toList(),
    );
  }

  Widget _buildButton({required String label, required BoxConstraints constraints}) {
    VoidCallback onPressed;
    Color color;

    switch (label) {
      case 'DEL':
        onPressed = _onDelete;
        color = Colors.orange;
        break;
      case 'OK':
        onPressed = widget.onConfirm;
        color = Colors.green;
        break;
      case 'CAN':
        onPressed = _onCancel;
        color = Colors.red;
        break;
      default:
        onPressed = () => _onInput(label);
        color = const Color.fromARGB(255, 205, 213, 224); // Chrysler Platinum Silver
    }

    return Padding(
      padding: const EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.zero,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(label),
        ),
      ),
    );
  }
}
