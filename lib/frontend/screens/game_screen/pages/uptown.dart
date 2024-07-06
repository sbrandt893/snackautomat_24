import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';
import 'package:snackautomat_24/frontend/screens/game_screen/game_screen.dart';
import 'package:snackautomat_24/frontend/screens/game_screen/widgets/animated_arrow_right.dart';
import 'package:snackautomat_24/frontend/screens/game_screen/widgets/hover_widget.dart';
import 'package:snackautomat_24/frontend/screens/game_screen/widgets/swing_animation.dart';
import 'package:snackautomat_24/frontend/screens/game_screen/widgets/tooltip_wrapper.dart';
import 'package:snackautomat_24/frontend/screens/game_screen/widgets/temporary_vending_machine.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';

class Uptown extends ConsumerWidget {
  const Uptown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameState gameState = ref.watch(gameStateProvider);
    bool isMobile = defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android;
    bool isNight = gameState.isNight;

    return Stack(
      alignment: Alignment.center,
      children: [
        //? Background Image
        Positioned.fill(
          child: GestureDetector(
            onDoubleTap: () {
              ref.read(gameStateProvider.notifier).toggleHighlightedTooltips();
            },
            child: ColorFiltered(
              colorFilter: isNight
                  ? const ColorFilter.matrix(
                      <double>[
                        0.1, 0, 0, 0, 0, // Red
                        0, 0.1, 0, 0, 0, // Green
                        0, 0, 0.3, 0, 0, // Blue (slightly higher to give a bluish tint)
                        0, 0, 0, 1, 0,
                      ],
                    )
                  : const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.srcOver,
                    ),
              child: Image.asset(
                'assets/images/backgrounds/uptown.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        //? Vending Machine
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.15, // 10% vom unteren Rand
          left: MediaQuery.of(context).size.width / 2 - 100, // Zentrieren des Automaten
          child: GestureDetector(
            onTap: () {
              if (gameState.highlightedTooltips) {
                ref.read(gameStateProvider.notifier).toggleHighlightedTooltips();
              }
              ref.read(gameStateProvider.notifier).setCurrentPage(Pages.newVendingMachineCloseup.index);
            },
            child: HoverWrapper(
              builder: (isHovered) {
                return TooltipWrapper(
                  tooltipIcon: SwingAnimation(
                    child: Image.asset(
                      'assets/images/bitcoin.png',
                      width: isMobile ? 33 : 50,
                      height: isMobile ? 33 : 50,
                    ),
                  ),
                  tooltipName: 'Vending Machine',
                  showTooltipIcon: isHovered || gameState.highlightedTooltips,
                  showTooltipName: isHovered || (gameState.highlightedTooltips && isMobile),
                  child: SizedBox(
                    width: 100,
                    height: MediaQuery.of(context).size.height * 0.24, // 40% der Bildschirmhöhe
                    child: const VendingMachineWidget(),
                  ),
                );
              },
            ),
          ),
        ), //? Arrow top left
        Positioned(
          top: isMobile ? 35 : 0,
          left: 10,
          child: !isMobile || gameState.highlightedTooltips
              ? SizedBox(
                  width: 80,
                  height: 80,
                  child: HoverWrapper(
                    builder: (isHovered) {
                      if (isHovered || gameState.highlightedTooltips) {
                        return GestureDetector(
                          onTap: () {
                            if (gameState.highlightedTooltips) {
                              ref.read(gameStateProvider.notifier).toggleHighlightedTooltips();
                            }
                            Navigator.pop(context);
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              WobbleHorizontal(
                                child: Image.asset('assets/images/arrow-left-red.png'),
                              ),
                              if (isHovered || isMobile)
                                const Positioned(
                                  bottom: -15,
                                  left: 0,
                                  child: Text(
                                    'Main Menu',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
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
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              : const SizedBox(),
        ),

        //? Arrow bottom right

        Positioned(
          bottom: 0,
          right: 10,
          child: !isMobile || gameState.highlightedTooltips
              ? SizedBox(
                  width: 80,
                  height: 80,
                  child: HoverWrapper(
                    builder: (isHovered) {
                      if (isHovered || gameState.highlightedTooltips) {
                        return GestureDetector(
                          onTap: () {
                            if (gameState.highlightedTooltips) {
                              ref.read(gameStateProvider.notifier).toggleHighlightedTooltips();
                            }
                            ref.read(gameStateProvider.notifier).setCurrentPage(Pages.downtown.index);
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              WobbleHorizontal(
                                reversed: true,
                                child: Image.asset('assets/images/arrow-right-red.png'),
                              ),
                              if (isHovered || isMobile)
                                const Positioned(
                                  bottom: 70,
                                  right: 0,
                                  child: Text(
                                    'Downtown',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
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
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
