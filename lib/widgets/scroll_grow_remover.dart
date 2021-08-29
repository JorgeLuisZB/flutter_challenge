import 'package:flutter/material.dart';

/// ScrollGrowRemover disables the glow effect throughout the application
class ScrollGrowRemover extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
