/// Motion duration tokens.
///
/// Keeping animation timings here (rather than inline) keeps motion
/// consistent across screens and easy to tune globally.
abstract final class AppDurations {
  /// Quick feedback: taps, small state changes.
  static const Duration fast = Duration(milliseconds: 150);

  /// Standard transitions: card entrances, state swaps.
  static const Duration medium = Duration(milliseconds: 300);

  /// Larger movements: page transitions, onboarding.
  static const Duration slow = Duration(milliseconds: 500);
}
