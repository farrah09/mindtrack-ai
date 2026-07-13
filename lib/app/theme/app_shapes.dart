import 'package:flutter/material.dart';

/// Shape tokens shared across cards, buttons, and sheets.
abstract final class AppShapes {
  static const double radiusSm = 12;
  static const double radiusMd = 16;
  static const double radiusLg = 24;

  static const BorderRadius cardRadius =
      BorderRadius.all(Radius.circular(radiusMd));

  static const RoundedRectangleBorder cardShape =
      RoundedRectangleBorder(borderRadius: cardRadius);

  static const RoundedRectangleBorder buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(radiusSm)),
  );

  /// Pill shape for chips (mood selection, filters).
  static const StadiumBorder chipShape = StadiumBorder();

  /// Chat bubble corners: rounded, with a tighter corner on the side
  /// the message originates from (applied per-side by the bubble widget).
  static const Radius bubbleRadius = Radius.circular(radiusLg);
  static const Radius bubbleOriginRadius = Radius.circular(6);
}
