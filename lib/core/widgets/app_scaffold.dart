import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';

/// Standard screen scaffold for MindTrack AI.
///
/// Applies the app bar, consistent horizontal padding, and safe-area
/// handling so individual screens only provide their content.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    this.actions,
    this.bottomNavigationBar,
    required this.body,
  });

  /// Localized screen title shown in the app bar.
  final String title;

  final List<Widget>? actions;

  final Widget? bottomNavigationBar;

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPadding,
          ),
          child: body,
        ),
      ),
    );
  }
}
