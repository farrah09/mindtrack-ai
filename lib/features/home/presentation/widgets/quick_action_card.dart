import 'package:flutter/material.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../core/widgets/mindtrack_card.dart';

/// Tappable shortcut tile on the home screen: icon plus label.
class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  /// Localized action label; doubles as the accessibility label.
  final String label;

  final IconData icon;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      child: MindTrackCard(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExcludeSemantics(
              child: Icon(icon, color: theme.colorScheme.primary),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(label, style: theme.textTheme.labelLarge),
          ],
        ),
      ),
    );
  }
}
