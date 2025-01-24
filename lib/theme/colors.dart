import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeColor {
  static Color primary = Color(0xFFe83566);
  static Color primaryLight = Color(0xFFf6edef);
  static Color secondary = Color(0xFF3da4f4);
  static Color alternate = Color(0xFFe57e25);
  static Color hover = Color(0xFF1d96f3);
  static Color jetBlack = Color(0xFF2b2b2b);
  static Color backgroundLight = Color(0xFFf7f7f7);
  static Color backgroundDark = Color(0xFFf7f7f7);
  static Color grey = Colors.black26;
  static const Color success = Color(0xFF4CAF50);
  static const Color danger = Color(0xFFF44336);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF2196F3);
  static const Color neutral = Color(0xFF9E9E9E);
}

class ThemeGradient {
  static LinearGradient primary = LinearGradient(colors: [ThemeColor.primary, ThemeColor.secondary], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static LinearGradient secondary = LinearGradient(colors: [HexColor("#A62929"), HexColor("#FE1010")], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static LinearGradient lite = LinearGradient(colors: [HexColor("#D8D3D3"), HexColor("#EE6C6C")], begin: Alignment.centerLeft, end: Alignment.centerRight);
  static LinearGradient semiTransparentBlack = LinearGradient(colors: [Colors.transparent, HexColor("#181717").withValues(alpha: .7)], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static LinearGradient semiTransparentWhite =
      LinearGradient(colors: [HexColor("#ffffff").withValues(alpha: 0), HexColor("#ffffff").withValues(alpha: 1)], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: const [0.2, .8]);
}
