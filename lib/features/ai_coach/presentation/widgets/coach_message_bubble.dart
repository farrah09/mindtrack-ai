import 'package:flutter/material.dart';

import '../../../../app/theme/app_shapes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../app/theme/wellness_colors.dart';
import '../../../../core/l10n/l10n.dart';

/// Chat bubble for the coach conversation.
///
/// Placeholder component for the AI coach feature: purely visual, the
/// caller supplies the message. Coach messages align left, user messages
/// right, with the sender announced to screen readers.
class CoachMessageBubble extends StatelessWidget {
  const CoachMessageBubble({
    super.key,
    required this.message,
    this.fromCoach = true,
  });

  /// Localized (or user-generated) message text.
  final String message;

  final bool fromCoach;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final wellness = context.wellnessColors;
    final l10n = context.l10n;

    final background = fromCoach ? wellness.coachBubble : wellness.userBubble;
    final foreground =
        fromCoach ? wellness.onCoachBubble : wellness.onUserBubble;

    return Align(
      alignment: fromCoach ? Alignment.centerLeft : Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
        ),
        child: Semantics(
          container: true,
          label: fromCoach
              ? l10n.coachMessageSemantics
              : l10n.userMessageSemantics,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm + AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.only(
                topLeft: AppShapes.bubbleRadius,
                topRight: AppShapes.bubbleRadius,
                bottomLeft: fromCoach
                    ? AppShapes.bubbleOriginRadius
                    : AppShapes.bubbleRadius,
                bottomRight: fromCoach
                    ? AppShapes.bubbleRadius
                    : AppShapes.bubbleOriginRadius,
              ),
            ),
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(color: foreground),
            ),
          ),
        ),
      ),
    );
  }
}
