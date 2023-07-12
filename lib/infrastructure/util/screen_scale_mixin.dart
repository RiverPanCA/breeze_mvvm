import 'package:flutter/material.dart';
import 'active_ref.dart';

mixin AppScaleMixin {
  // This mixin will only be used from code where context already exist
  // Leaving null for safety check
  BuildContext? get _context => ActiveRef.navigatorKey.currentContext;

  double w(double widthScale) {
    return scaledWidth(widthScale);
  }

  double h(double heightScale) {
    return scaledHeight(heightScale);
  }

  double W(double widthScale) {
    return scaledWidth(widthScale);
  }

  double H(double heightScale) {
    return scaledHeight(heightScale);
  }

  double width(double widthScale) {
    return scaledWidth(widthScale);
  }

  double height(double heightScale) {
    return scaledHeight(heightScale);
  }

  double scaledWidth(double widthScale) {
    if (_context == null) {
      return 100;
    }

    return MediaQuery.of(_context!).size.width * widthScale;
  }

  double scaledHeight(double heightScale) {
    if (_context == null) {
      return 100;
    }

    return MediaQuery.of(_context!).size.height * heightScale;
  }
}
