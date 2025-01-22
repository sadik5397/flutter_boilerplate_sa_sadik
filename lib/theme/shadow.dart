import 'package:flutter/material.dart';

import '../api/constant.dart';

class ThemeShadow {
  static List<BoxShadow> primary = [BoxShadow(color: Colors.black.withValues(alpha: .08), blurRadius: Constant.unitMultiplier * 5, offset: Offset(0, Constant.unitMultiplier))];
}
