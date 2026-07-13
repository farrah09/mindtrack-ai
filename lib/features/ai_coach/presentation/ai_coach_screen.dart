import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/empty_state_view.dart';
import '../../../core/widgets/entrance_fade.dart';
import '../../../core/widgets/mindtrack_card.dart';

/// AI coach screen — placeholder until the mock coach lands.
class AiCoachScreen extends StatelessWidget {
  const AiCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return AppScaffold(
      title: l10n.aiCoachTitle,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.sm),
          EntranceFade(
            child: MindTrackCard(
              child: Text(
                l10n.aiCoachDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Expanded(
            child: EmptyStateView(
              icon: Icons.chat_bubble_outline,
              title: l10n.aiCoachEmptyTitle,
              message: l10n.aiCoachEmptyMessage,
            ),
          ),
        ],
      ),
    );
  }
}
