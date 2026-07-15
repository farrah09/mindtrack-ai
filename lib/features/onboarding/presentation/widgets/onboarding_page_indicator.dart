import 'package:flutter/material.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../core/constants/app_durations.dart';
import '../../../../core/l10n/l10n.dart';

/// Dot indicator for the onboarding pages.
///
/// The active dot stretches into a pill. Position is announced to screen
/// readers as "Page x of y" instead of exposing the individual dots.
class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({
    super.key,
    required this.pageCount,
    required this.currentPage,
  });

  final int pageCount;

  /// Zero-based index of the visible page.
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      container: true,
      label: context.l10n.onboardingPageSemantics(currentPage + 1, pageCount),
      child: ExcludeSemantics(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < pageCount; i++)
              AnimatedContainer(
                duration: AppDurations.medium,
                curve: AppCurves.standard,
                margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
                width: i == currentPage ? AppSpacing.lg : AppSpacing.sm,
                height: AppSpacing.sm,
                decoration: BoxDecoration(
                  color: i == currentPage
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSpacing.xs)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
