import 'package:flutter/material.dart';

/// Secondary call-to-action: a full-width outlined Material 3 button.
///
/// Pairs with [PrimaryActionButton] for less prominent actions
/// ("Skip", "Not now", "See all"). Size and shape come from the theme.
class SecondaryActionButton extends StatelessWidget {
  const SecondaryActionButton({
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
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
    }
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
