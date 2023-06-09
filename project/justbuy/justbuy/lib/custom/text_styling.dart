import 'package:flutter/material.dart';

import 'color_file.dart';

elione({double? fontSize, color, fontWeight, double? latterSpacing}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? DynamicColor.whiteColor,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: 'elione',
    letterSpacing: latterSpacing ?? 1,
  );
}

poppins({double? fontSize, color, fontWeight, double? latterSpacing}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? DynamicColor.whiteColor,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: 'elione',
    letterSpacing: latterSpacing ?? 1,
  );
}
