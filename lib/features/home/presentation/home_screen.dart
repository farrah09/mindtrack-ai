import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routing/app_routes.dart';
import '../../../app/theme/app_shapes.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/animated_page_section.dart';
import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/app_screen_container.dart';
import '../../../core/widgets/mindtrack_card.dart';
import '../../../core/widgets/section_header.dart';
import '../../ai_coach/presentation/widgets/coach_message_bubble.dart';
import 'widgets/home_greeting_header.dart';
import 'widgets/quick_action_card.dart';

/// Home shell: greeting, today overview, quick actions, and entry points
/// into each feature.
///
/// All cards are honest placeholders — no fabricated stats. They fill
/// with real data as the habit, mood, and coach features land.
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
        scrollable: true,
        children: [
          const SizedBox(height: AppSpacing.md),
          const AnimatedPageSection(
            child: HomeGreetingHeader(),
          ),
          const SizedBox(height: AppSpacing.lg),
          AnimatedPageSection(
            index: 1,
            child: MindTrackCard(
              child: Row(
                children: [
                  ExcludeSemantics(
                    child: Icon(
                      Icons.wb_sunny_outlined,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.homeTodayOverviewTitle,
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          l10n.homeTodayOverviewMessage,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPageSection(
            index: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(title: l10n.homeQuickActionsTitle),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: QuickActionCard(
                          label: l10n.homeActionAddHabit,
                          icon: Icons.add_circle_outline,
                          onTap: () => context.goNamed(AppRoutes.habitsName),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: QuickActionCard(
                          label: l10n.homeActionMoodCheckIn,
                          icon: Icons.sentiment_satisfied_outlined,
                          onTap: () => context.goNamed(AppRoutes.moodName),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: QuickActionCard(
                          label: l10n.homeActionAskCoach,
                          icon: Icons.chat_bubble_outline,
                          onTap: () => context.goNamed(AppRoutes.aiCoachName),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: QuickActionCard(
                          label: l10n.homeActionViewInsights,
                          icon: Icons.insights_outlined,
                          onTap: () =>
                              context.goNamed(AppRoutes.analyticsName),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPageSection(
            index: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(title: l10n.homeHabitsSectionTitle),
                _FeatureEntryCard(
                  icon: Icons.check_circle_outline,
                  title: l10n.homeHabitsPreviewTitle,
                  message: l10n.homeHabitsPreviewMessage,
                  onTap: () => context.goNamed(AppRoutes.habitsName),
                ),
              ],
            ),
          ),
          AnimatedPageSection(
            index: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(title: l10n.homeMoodSectionTitle),
                _FeatureEntryCard(
                  icon: Icons.sentiment_satisfied_outlined,
                  title: l10n.homeMoodCardTitle,
                  message: l10n.homeMoodCardMessage,
                  onTap: () => context.goNamed(AppRoutes.moodName),
                ),
              ],
            ),
          ),
          AnimatedPageSection(
            index: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(title: l10n.homeCoachSectionTitle),
                MindTrackCard(
                  onTap: () => context.goNamed(AppRoutes.aiCoachName),
                  child: CoachMessageBubble(
                    message: l10n.homeCoachPreviewMessage,
                  ),
                ),
              ],
            ),
          ),
          AnimatedPageSection(
            index: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(
                  title: l10n.homeWeeklyReflectionTitle,
                  trailing: const _ComingSoonBadge(),
                ),
                MindTrackCard(
                  child: Text(
                    l10n.homeWeeklyReflectionMessage,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Tappable card that invites the user into a feature: icon, title,
/// message, and a chevron affordance.
class _FeatureEntryCard extends StatelessWidget {
  const _FeatureEntryCard({
    required this.icon,
    required this.title,
    required this.message,
    required this.onTap,
  });

  final IconData icon;

  final String title;

  final String message;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      child: MindTrackCard(
        onTap: onTap,
        child: Row(
          children: [
            ExcludeSemantics(
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppShapes.radiusSm),
                  ),
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
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            ExcludeSemantics(
              child: Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "Coming soon" pill shown next to sections that are not built yet.
class _ComingSoonBadge extends StatelessWidget {
  const _ComingSoonBadge();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: ShapeDecoration(
        color: theme.colorScheme.secondaryContainer,
        shape: AppShapes.chipShape,
      ),
      child: Text(
        context.l10n.commonComingSoon,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSecondaryContainer,
        ),
      ),
    );
  }
}
