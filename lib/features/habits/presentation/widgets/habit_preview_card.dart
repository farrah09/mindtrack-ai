import 'package:flutter/material.dart';

import '../../../../app/theme/app_shapes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/wellness_colors.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/widgets/mindtrack_card.dart';
import '../../../../core/widgets/state_transition_switcher.dart';

/// Compact habit row: icon, title, optional subtitle, completion state.
///
/// Placeholder component for the habits feature: purely visual, the
/// caller owns the data and state. Completion is communicated by a check
/// icon and a screen-reader label — never by color alone.
class HabitPreviewCard extends StatelessWidget {
  const HabitPreviewCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.completed = false,
    this.onTap,
  });

  /// Localized habit name.
  final String title;

  /// Localized supporting line (e.g. schedule or streak).
  final String? subtitle;

  final IconData icon;

  final bool completed;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final wellness = context.wellnessColors;
    final l10n = context.l10n;
    return MindTrackCard(
      onTap: onTap,
      child: Row(
        children: [
          ExcludeSemantics(
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius:
                    const BorderRadius.all(Radius.circular(AppShapes.radiusSm)),
              ),
              child: Icon(
                icon,
                size: 24,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleMedium),
                if (subtitle case final subtitle?) ...[
                  const SizedBox(height: AppSpacing.xs / 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Semantics(
            container: true,
            label: completed
                ? l10n.habitCompletedSemantics
                : l10n.habitNotCompletedSemantics,
            child: ExcludeSemantics(
              child: StateTransitionSwitcher(
                child: completed
                    ? Icon(
                        Icons.check_circle,
                        key: const ValueKey('completed'),
                        size: 28,
                        color: wellness.positive,
                      )
                    : Icon(
                        Icons.circle_outlined,
                        key: const ValueKey('pending'),
                        size: 28,
                        color: theme.colorScheme.outlineVariant,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
