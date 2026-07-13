import 'package:flutter/material.dart';

/// Brand color tokens for MindTrack AI.
///
/// These are the raw seed values the Material 3 color schemes are built
/// from. Widgets should read colors from [ColorScheme] via `Theme.of` —
/// only theme construction should reference this class directly.
abstract final class AppColors {
  /// Calm teal-green — the primary brand seed.
  static const Color seed = Color(0xFF3E8E7E);

  /// Warm sand accent used as the secondary seed influence.
  static const Color warmAccent = Color(0xFFE0A458);

  /// Soft off-white surface for the light theme background.
  static const Color surfaceLight = Color(0xFFFAF9F6);

  /// Deep neutral surface for the dark theme background.
  static const Color surfaceDark = Color(0xFF14181B);
}
