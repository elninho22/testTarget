import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const_colors.dart';

class FactoryTextStyles {
  /// [fontSize: 22, FontWeight.w500, ConstColors.blackFull, letterSpacing: 0]
  static TextStyle titleAppBar({
    Color color = ConstColors.black100,
    FontWeight fontWeight = FontWeight.w400,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.ubuntu(
          fontSize: 22,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing,
          height: 28 / 22);
  

  /// [fontSize: 16, FontWeight.w500, ConstColors.blackFull, letterSpacing: 0]
  static TextStyle bodySmall({
    Color color = ConstColors.blackFull,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.ubuntu(
        fontSize: 16,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      );
}
