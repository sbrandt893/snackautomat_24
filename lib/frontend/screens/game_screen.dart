import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/game_state.dart';
import 'package:snackautomat_24/frontend/router/app_router.dart';
import 'package:snackautomat_24/frontend/router/cursor_type_router.dart';
import 'package:snackautomat_24/frontend/widgets/animated_arrow_right.dart';
import 'package:snackautomat_24/frontend/widgets/custom_bottom_appbar.dart';
import 'package:snackautomat_24/frontend/widgets/custom_cursor_widget.dart';
import 'package:snackautomat_24/frontend/widgets/hover_widget.dart';
import 'package:snackautomat_24/frontend/widgets/swing_animation.dart';
import 'package:snackautomat_24/frontend/widgets/tooltip_widget.dart';
import 'package:snackautomat_24/frontend/widgets/vending_machine.dart';
import 'package:snackautomat_24/logic/provider/all_provider.dart';
import 'package:snackautomat_24/logic/provider/cursor_state_notifier.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<GameScreen> {
  bool isNight = false;

  @override
  Widget build(BuildContext context) {
    GameState gameState = ref.watch(gameStateProvider);
    CursorTypes cursorType = ref.watch(cursorStateProvider);

    Widget cursorWidget = CursorTypeRouter.getWidgetFromCursorType(cursorType);

    return GestureDetector(
      onDoubleTap: () {
        ref.read(gameStateProvider.notifier).toggleHighlightedTooltips();
      },
      child: CustomCursor(
        cursor: cursorWidget,
        child: Scaffold(
          body: MouseRegion(
            onEnter: (_) {
              ref.read(cursorStateProvider.notifier).resetCursorType();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                //? Background Image
                Positioned.fill(
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
                      'assets/images/backgrounds/street_side_far.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //? Vending Machine
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.15, // 10% vom unteren Rand
                  left: MediaQuery.of(context).size.width / 2 - 100, // Zentrieren des Automaten
                  child: TooltipWidget(
                    tooltipIcon: SwingAnimation(
                      child: Image.asset('assets/images/bitcoin.png', width: 33, height: 33),
                    ),
                    tooltipName: 'Settings',
                    showTooltip: gameState.highlightedTooltips,
                    child: HoverBuilder(
                      onHoverChanged: (isHovered) {
                        if (isHovered) {
                          ref.read(cursorStateProvider.notifier).setCursorType(CursorTypes.coin);
                        }
                      },
                      builder: (isHovered) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.settings.name);
                          },
                          child: SizedBox(
                            width: 100,
                            height: MediaQuery.of(context).size.height * 0.24, // 40% der Bildschirmhöhe
                            child: VendingMachineWidget(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //? Arrow Right
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: HoverBuilder(
                      onHoverChanged: (isHovered) {
                        if (isHovered) {
                          ref.read(cursorStateProvider.notifier).setCursorType(CursorTypes.arrowRight);
                        }
                      },
                      builder: (isHovered) {
                        return isHovered || gameState.highlightedTooltips
                            ? WobbleHorizontal(
                                reversed: true,
                                child: Image.asset('assets/images/arrow-right-red.png'),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
                ),
                //? Arrow Left
                Positioned(
                  top: 0,
                  left: 0,
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: HoverBuilder(
                      onHoverChanged: (isHovered) {
                        if (isHovered) {
                          ref.read(cursorStateProvider.notifier).setCursorType(CursorTypes.arrowLeft);
                        }
                      },
                      builder: (isHovered) {
                        return isHovered
                            ? WobbleHorizontal(
                                child: Image.asset('assets/images/arrow-left-red.png'),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const CustomBottomAppBar(),
        ),
      ),
    );
  }
}
