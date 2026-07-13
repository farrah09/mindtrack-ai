/// Spacing tokens, in logical pixels, on a 4px base grid.
///
/// Use these instead of hardcoded padding/margin values so screens stay
/// visually consistent and spacing can be tuned in one place.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  /// Default horizontal padding for screen content.
  static const double screenPadding = 20;
}
