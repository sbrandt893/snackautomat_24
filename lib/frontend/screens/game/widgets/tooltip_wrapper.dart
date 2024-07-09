import 'package:flutter/foundation.dart';
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
    bool isMobile = defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;

    return Stack(
      clipBehavior: Clip.none,
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
                    top: isMobile ? 30 : 45,
                    left: isMobile ? _calculateLeftOffset(length: tooltipName.length, factor: 4.5) : _calculateLeftOffset(length: tooltipName.length, factor: 6.5),
                    child: Text(
                      tooltipName,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 252, 217, 117),
                        fontSize: isMobile ? 18 : 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto Mono',
                        shadows: [
                          BoxShadow(
                            offset: const Offset(5, 3),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.9),
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
double _calculateLeftOffset({required int length, required double factor}) {
  // This is an example adjustment factor; you may need to tweak it
  double adjustmentFactor = factor;
  double baseOffset = 13; // Base offset

  // Adjust the left offset based on the length of the tooltip name
  return baseOffset - (length * adjustmentFactor);
}
