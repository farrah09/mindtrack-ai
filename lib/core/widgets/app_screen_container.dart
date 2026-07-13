import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';

/// Standard content container for a screen body.
///
/// Applies the app's horizontal screen padding and lays children out in
/// a stretched column. Set [scrollable] for content that can exceed the
/// viewport; leave it off when the layout uses [Expanded] children.
class AppScreenContainer extends StatelessWidget {
  const AppScreenContainer({
    super.key,
    this.scrollable = false,
    required this.children,
  });

  final bool scrollable;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
      ),
      child: scrollable
          ? SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: AppSpacing.lg),
              child: column,
            )
          : column,
    );
  }
}
