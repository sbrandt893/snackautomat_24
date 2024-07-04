import 'package:flutter/material.dart';

class TooltipWrapper extends StatelessWidget {
  final Widget child;
  final Widget tooltipIcon;
  final String tooltipName;
  final bool showTooltipIcon;
  final bool showTooltipName;

  const TooltipWrapper({
    required this.child,
    required this.tooltipIcon,
    required this.tooltipName,
    required this.showTooltipIcon,
    required this.showTooltipName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows the tooltip to overflow
      children: [
        child,
        Positioned(
            top: -5,
            right: -5,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                if (showTooltipIcon) tooltipIcon,
                if (showTooltipName)
                  Positioned(
                    top: 30,
                    //cebter the text
                    left: _calculateLeftOffset(tooltipName.length),
                    // left: 10 - (tooltipName.length + 1) * 4.5,
                    child: Text(
                      tooltipName,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 252, 217, 117),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto Mono',
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            )),
      ],
    );
  }
}

// Calculate the left offset based on the length of the tooltip name
double _calculateLeftOffset(int length) {
  // This is an example adjustment factor; you may need to tweak it
  double adjustmentFactor = 4.5;
  double baseOffset = 13.0; // Base offset

  // Adjust the left offset based on the length of the tooltip name
  return baseOffset - (length * adjustmentFactor);
}
