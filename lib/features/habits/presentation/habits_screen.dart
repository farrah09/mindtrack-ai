import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/animated_page_section.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_screen_container.dart';
import '../../../core/widgets/empty_state_view.dart';
import '../../../core/widgets/mindtrack_card.dart';

/// Habit tracking screen — placeholder until the habits feature lands.
class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return AppScaffold(
      title: l10n.habitsTitle,
      body: AppScreenContainer(
        children: [
          const SizedBox(height: AppSpacing.sm),
          AnimatedPageSection(
            child: MindTrackCard(
              child: Text(
                l10n.habitsDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Expanded(
            child: EmptyStateView(
              icon: Icons.check_circle_outline,
              title: l10n.habitsEmptyTitle,
              message: l10n.habitsEmptyMessage,
            ),
          ),
        ],
      ),
    );
  }
}
