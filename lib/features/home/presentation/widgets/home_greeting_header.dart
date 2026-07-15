import 'package:flutter/material.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../core/l10n/l10n.dart';

/// Time-of-day greeting at the top of the home screen.
class HomeGreetingHeader extends StatelessWidget {
  const HomeGreetingHeader({super.key, this.clock});

  /// Overrides the current time, for tests. Defaults to [DateTime.now].
  final DateTime? clock;

  String _greeting(AppLocalizations l10n) {
    final hour = (clock ?? DateTime.now()).hour;
    if (hour < 12) return l10n.homeGreetingMorning;
    if (hour < 17) return l10n.homeGreetingAfternoon;
    return l10n.homeGreetingEvening;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_greeting(l10n), style: theme.textTheme.headlineSmall),
        const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.homeGreetingSubtitle,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
