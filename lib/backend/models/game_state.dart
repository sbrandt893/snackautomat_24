class GameState {
  final int currentPage;
  final bool highlightedTooltips;
  final bool isNight;
  final bool hammerEquipped;
  final List<dynamic> inventory;
  final bool showControlPanelNewVendingMachine;
  final bool showInventory;

  GameState({
    this.highlightedTooltips = false,
    this.currentPage = 0,
    this.isNight = false,
    this.hammerEquipped = false,
    this.inventory = const [],
    this.showControlPanelNewVendingMachine = false,
    this.showInventory = false,
  });

  GameState copyWith({
    bool? highlightedTooltips,
    int? currentPage,
    bool? isNight,
    bool? hammerEquipped,
    List<dynamic>? inventory,
    bool? showControlPanelNewVendingMachine,
    bool? showInventory,
  }) {
    return GameState(
      highlightedTooltips: highlightedTooltips ?? this.highlightedTooltips,
      currentPage: currentPage ?? this.currentPage,
      isNight: isNight ?? this.isNight,
      hammerEquipped: hammerEquipped ?? this.hammerEquipped,
      inventory: inventory ?? this.inventory,
      showControlPanelNewVendingMachine: showControlPanelNewVendingMachine ?? this.showControlPanelNewVendingMachine,
      showInventory: showInventory ?? this.showInventory,
    );
  }

  @override
  String toString() {
    return 'GameState(highlightedTooltips: $highlightedTooltips, currentPage: $currentPage, isNight: $isNight, hammerEquipped: $hammerEquipped, inventory: $inventory, showControlPanelNewVendingMachine: $showControlPanelNewVendingMachine, showInventory: $showInventory)';
  }
}
