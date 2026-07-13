import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';

/// Section heading with an optional trailing action, marked as a header
/// for assistive technologies.
class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.trailing});

  /// Localized section title.
  final String title;

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.lg,
        bottom: AppSpacing.sm,
      ),
      child: Row(
        children: [
          Expanded(
            child: Semantics(
              header: true,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          if (trailing case final trailing?) trailing,
        ],
      ),
    );
  }
}
