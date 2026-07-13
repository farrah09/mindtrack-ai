import 'package:flutter/animation.dart';

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

  /// Delay between staggered section entrances on one screen.
  static const Duration stagger = Duration(milliseconds: 60);
}

/// Motion curve tokens, paired with [AppDurations].
abstract final class AppCurves {
  /// Elements entering the screen: fast start, gentle settle.
  static const Curve enter = Curves.easeOutCubic;

  /// Elements leaving the screen.
  static const Curve exit = Curves.easeIn;

  /// In-place changes: selection, size, color.
  static const Curve standard = Curves.easeInOut;
}
