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
}
