import 'package:flutter/material.dart';

import '../constants/app_durations.dart';

/// Cross-fades between UI states (loading → content, empty → list).
///
/// Thin wrapper over [AnimatedSwitcher] with the app's standard motion.
/// Give each state a distinct [Key] (e.g. `ValueKey('loading')`) so the
/// switcher knows the child changed.
class StateTransitionSwitcher extends StatelessWidget {
  const StateTransitionSwitcher({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppDurations.medium,
      switchInCurve: AppCurves.enter,
      switchOutCurve: AppCurves.exit,
      child: child,
    );
  }
}
