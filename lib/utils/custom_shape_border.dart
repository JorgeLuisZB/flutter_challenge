import 'package:flutter/material.dart';
import 'package:jorge_zaragoza_challenge/utils/utils.dart' as util;

/// CustomShapeBorder creates the wave for the App bar
class CustomShapeBorder extends ContinuousRectangleBorder {
  final BuildContext context;

  CustomShapeBorder(this.context);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return util.curvePath(
      Size(util.getScreenWidth(context), util.getScreenHeight(context) * 0.18),
      10.0,
      10.25,
    );
  }
}
