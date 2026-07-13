import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/empty_state_view.dart';
import '../../../core/widgets/entrance_fade.dart';
import '../../../core/widgets/mindtrack_card.dart';

/// Analytics screen — placeholder until real trend data exists.
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return AppScaffold(
      title: l10n.analyticsTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.sm),
          EntranceFade(
            child: MindTrackCard(
              child: Text(
                l10n.analyticsDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Expanded(
            child: EmptyStateView(
              icon: Icons.insights_outlined,
              title: l10n.analyticsEmptyTitle,
              message: l10n.analyticsEmptyMessage,
            ),
          ),
        ],
      ),
    );
  }
}
