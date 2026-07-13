import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/animated_page_section.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_screen_container.dart';
import '../../../core/widgets/empty_state_view.dart';
import '../../../core/widgets/mindtrack_card.dart';

/// Mood check-in screen — placeholder until the mood feature lands.
class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return AppScaffold(
      title: l10n.moodTitle,
      body: AppScreenContainer(
        children: [
          const SizedBox(height: AppSpacing.sm),
          AnimatedPageSection(
            child: MindTrackCard(
              child: Text(
                l10n.moodDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Expanded(
            child: EmptyStateView(
              icon: Icons.sentiment_satisfied_outlined,
              title: l10n.moodEmptyTitle,
              message: l10n.moodEmptyMessage,
            ),
          ),
        ],
      ),
    );
  }
}
