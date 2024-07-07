import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_24/backend/models/glas_pane.dart';

class GlassPaneNotifier extends StateNotifier<GlassPane> {
  GlassPaneNotifier() : super(GlassPane.standard());
}
