class GameState {
  final int currentPage;
  final bool highlightedTooltips;
  final bool isNight;

  GameState({this.highlightedTooltips = false, this.currentPage = 0, this.isNight = false});

  GameState copyWith({bool? highlightedTooltips, int? currentPage, bool? isNight}) {
    return GameState(
      highlightedTooltips: highlightedTooltips ?? this.highlightedTooltips,
      currentPage: currentPage ?? this.currentPage,
      isNight: isNight ?? this.isNight,
    );
  }

  @override
  String toString() {
    return 'GameState(highlightedTooltips: $highlightedTooltips, currentPage: $currentPage, isNight: $isNight)';
  }
}
