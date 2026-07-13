import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routing/app_routes.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/widgets/app_screen_container.dart';
import '../../../core/widgets/entrance_fade.dart';
import '../../../core/widgets/primary_action_button.dart';

/// First-run welcome screen.
///
/// Single static page for now; a multi-page intro and persisted
/// "onboarding completed" flag are planned for a later commit.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: AppScreenContainer(
          children: [
            Expanded(
              child: EntranceFade(
                child: Column(
                  children: [
                    const Spacer(),
                    ExcludeSemantics(
                      child: Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.self_improvement,
                          size: 48,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Text(
                      l10n.onboardingTitle,
                      style: theme.textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      l10n.onboardingDescription,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryActionButton(
                        label: l10n.onboardingGetStarted,
                        onPressed: () => context.goNamed(AppRoutes.homeName),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
