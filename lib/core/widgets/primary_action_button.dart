import 'package:flutter/material.dart';

/// The app's main call-to-action button.
///
/// A full-width Material 3 [FilledButton] whose size, shape, and text
/// style come from the theme. Disabled while [onPressed] is null.
class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  /// Localized button label.
  final String label;

  final VoidCallback? onPressed;

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (icon case final icon?) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
    }
    return FilledButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
