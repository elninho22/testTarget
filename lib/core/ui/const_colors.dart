import 'package:flutter/material.dart';

class ConstColors {
  /// Light whiteLight [FFFFF]
  static const Color white = Color(0xFFFFFFFF);

  /// Light white300 [CCCCCC]
  static const Color white300 = Color(0xFFCCCCCC);

  /// Light white200 [#EFEFEF]
  static const Color white200 = Color(0xFFEFEFEF);

  /// Red 300 [D5543A]
  static const Color red300 = Color(0xFFD5543A);

  /// Primary primary  [007045]
  static const Color primary = Color(0xFF007045);

  /// Primary light 100 [CEDF00]
  static const Color primary100 = Color(0xFFCEDF00);

  /// black full [FF509D]
  static const Color blackFull = Colors.black;

  /// Light black 100 [1C1B1F]
  static const Color black100 = Color(0XFF1C1B1F);

  ///  green100 100 [44BD6E]
  static const Color green100 = Color(0XFF44BD6E);

  ///  greenGradientOne  [205064]
  static const Color greenGradientOne = Color(0xFF205064);

  ///  greenGradientTwo  [277278]
  static const Color greenGradientTwo = Color(0xFF277278);
  static const LinearGradient gradient = LinearGradient(
    colors: [
      ConstColors.greenGradientOne,
      ConstColors.greenGradientTwo,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.1, 0.9],
    tileMode: TileMode.clamp,
  );
}
