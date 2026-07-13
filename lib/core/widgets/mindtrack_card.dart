import 'package:flutter/material.dart';

import '../../app/theme/app_shapes.dart';
import '../../app/theme/app_spacing.dart';

/// Rounded content card used across MindTrack AI.
///
/// Wraps [Card] with the app's shape and padding defaults and an optional
/// tap handler with the correct ink shape.
class MindTrackCard extends StatelessWidget {
  const MindTrackCard({
    super.key,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    required this.child,
  });

  final VoidCallback? onTap;

  final EdgeInsetsGeometry padding;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final content = Padding(padding: padding, child: child);
    return Card(
      child: onTap == null
          ? content
          : InkWell(
              onTap: onTap,
              borderRadius: AppShapes.cardRadius,
              child: content,
            ),
    );
  }
}
