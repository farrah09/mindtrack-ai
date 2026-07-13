import 'package:flutter/material.dart';

/// Wellness-specific color tokens that the Material 3 [ColorScheme]
/// does not cover: positive/success tones and chat bubble colors.
///
/// Registered as a [ThemeExtension] so widgets read it via
/// `Theme.of(context).extension<WellnessColors>()`.
@immutable
class WellnessColors extends ThemeExtension<WellnessColors> {
  const WellnessColors({
    required this.positive,
    required this.onPositive,
    required this.positiveContainer,
    required this.onPositiveContainer,
    required this.coachBubble,
    required this.onCoachBubble,
    required this.userBubble,
    required this.onUserBubble,
  });

  /// Gentle green for completed habits and positive trends.
  final Color positive;
  final Color onPositive;
  final Color positiveContainer;
  final Color onPositiveContainer;

  /// Chat bubble colors for the coach conversation.
  final Color coachBubble;
  final Color onCoachBubble;
  final Color userBubble;
  final Color onUserBubble;

  static const WellnessColors light = WellnessColors(
    positive: Color(0xFF4E8C52),
    onPositive: Color(0xFFFFFFFF),
    positiveContainer: Color(0xFFD8EBD5),
    onPositiveContainer: Color(0xFF17351C),
    coachBubble: Color(0xFFE2EFEA),
    onCoachBubble: Color(0xFF1F3833),
    userBubble: Color(0xFFF0E7D8),
    onUserBubble: Color(0xFF3A3225),
  );

  static const WellnessColors dark = WellnessColors(
    positive: Color(0xFF9BCF9C),
    onPositive: Color(0xFF0F2912),
    positiveContainer: Color(0xFF2E4B31),
    onPositiveContainer: Color(0xFFD3EAD2),
    coachBubble: Color(0xFF243733),
    onCoachBubble: Color(0xFFD6E7E1),
    userBubble: Color(0xFF3A3528),
    onUserBubble: Color(0xFFEAE1CF),
  );

  @override
  WellnessColors copyWith({
    Color? positive,
    Color? onPositive,
    Color? positiveContainer,
    Color? onPositiveContainer,
    Color? coachBubble,
    Color? onCoachBubble,
    Color? userBubble,
    Color? onUserBubble,
  }) {
    return WellnessColors(
      positive: positive ?? this.positive,
      onPositive: onPositive ?? this.onPositive,
      positiveContainer: positiveContainer ?? this.positiveContainer,
      onPositiveContainer: onPositiveContainer ?? this.onPositiveContainer,
      coachBubble: coachBubble ?? this.coachBubble,
      onCoachBubble: onCoachBubble ?? this.onCoachBubble,
      userBubble: userBubble ?? this.userBubble,
      onUserBubble: onUserBubble ?? this.onUserBubble,
    );
  }

  @override
  WellnessColors lerp(WellnessColors? other, double t) {
    if (other == null) return this;
    return WellnessColors(
      positive: Color.lerp(positive, other.positive, t)!,
      onPositive: Color.lerp(onPositive, other.onPositive, t)!,
      positiveContainer:
          Color.lerp(positiveContainer, other.positiveContainer, t)!,
      onPositiveContainer:
          Color.lerp(onPositiveContainer, other.onPositiveContainer, t)!,
      coachBubble: Color.lerp(coachBubble, other.coachBubble, t)!,
      onCoachBubble: Color.lerp(onCoachBubble, other.onCoachBubble, t)!,
      userBubble: Color.lerp(userBubble, other.userBubble, t)!,
      onUserBubble: Color.lerp(onUserBubble, other.onUserBubble, t)!,
    );
  }
}

/// Shorthand for reading wellness tokens: `context.wellnessColors`.
extension WellnessColorsX on BuildContext {
  WellnessColors get wellnessColors =>
      Theme.of(this).extension<WellnessColors>() ?? WellnessColors.light;
}
