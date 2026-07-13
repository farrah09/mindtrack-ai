import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';
import '../l10n/l10n.dart';

/// Centered loading indicator with a localized label for screen readers.
class LoadingStateView extends StatelessWidget {
  const LoadingStateView({super.key, this.label});

  /// Localized loading label; defaults to the generic "Loading…" string.
  final String? label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = label ?? context.l10n.commonLoading;
    return Center(
      child: Semantics(
        label: text,
        liveRegion: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: AppSpacing.md),
            ExcludeSemantics(
              child: Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
