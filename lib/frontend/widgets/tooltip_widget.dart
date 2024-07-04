import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  final Widget child;
  final Widget tooltipIcon;
  final String tooltipName;
  final bool showTooltip;

  const TooltipWidget({
    required this.child,
    required this.tooltipIcon,
    required this.tooltipName,
    this.showTooltip = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;

    return Stack(
      clipBehavior: Clip.none, // Allows the tooltip to overflow
      children: [
        child,
        if (showTooltip)
          Positioned(
            top: -5,
            right: -15,
            child: isMobile
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      tooltipIcon,
                      Text(
                        tooltipName,
                        style: const TextStyle(color: Colors.amber), // adjust color as needed
                      ),
                    ],
                  )
                : tooltipIcon,
          ),
      ],
    );
  }
}
