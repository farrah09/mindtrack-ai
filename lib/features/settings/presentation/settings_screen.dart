import 'package:flutter/material.dart';

import '../../../app/theme/app_spacing.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/animated_page_section.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_screen_container.dart';
import '../../../core/widgets/mindtrack_card.dart';

/// Settings screen — placeholder until preferences land.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return AppScaffold(
      title: l10n.settingsTitle,
      body: AppScreenContainer(
        children: [
          const SizedBox(height: AppSpacing.sm),
          AnimatedPageSection(
            child: MindTrackCard(
              child: Text(
                l10n.settingsDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
