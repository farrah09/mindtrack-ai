import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routing/app_routes.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/animated_page_section.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_screen_container.dart';
import '../../../core/widgets/empty_state_view.dart';
import '../../../core/widgets/mindtrack_card.dart';

/// Daily overview screen — placeholder until habits and mood land.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return AppScaffold(
      title: l10n.homeTitle,
      actions: [
        IconButton(
          onPressed: () => context.pushNamed(AppRoutes.settingsName),
          icon: const Icon(Icons.settings_outlined),
          tooltip: l10n.semanticsOpenSettings,
        ),
      ],
      body: AppScreenContainer(
        children: [
          const SizedBox(height: AppSpacing.sm),
          AnimatedPageSection(
            child: MindTrackCard(
              child: Text(
                l10n.homeDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Expanded(
            child: EmptyStateView(
              icon: Icons.wb_sunny_outlined,
              title: l10n.homeEmptyTitle,
              message: l10n.homeEmptyMessage,
            ),
          ),
        ],
      ),
    );
  }
}
