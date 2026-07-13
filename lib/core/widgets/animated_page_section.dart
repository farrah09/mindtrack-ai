import 'package:flutter/material.dart';

import '../constants/app_durations.dart';
import 'entrance_fade.dart';

/// Staggers section entrances on a screen.
///
/// Give each top-level section its position ([index]) and sections fade
/// in one after another. Purely presentational — wrap any widget.
class AnimatedPageSection extends StatelessWidget {
  const AnimatedPageSection({
    super.key,
    this.index = 0,
    required this.child,
  });

  /// Zero-based position of this section on the screen.
  final int index;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EntranceFade(
      delay: AppDurations.stagger * index,
      child: child,
    );
  }
}
