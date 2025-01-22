import 'package:flutter/material.dart';

import '../api/constant.dart';

class Gap {
  static double value = Constant.unitMultiplier;

  //region horizontal
  static SizedBox gx1 = SizedBox(width: value * 1);
  static SizedBox gx2 = SizedBox(width: value * 2);
  static SizedBox gx3 = SizedBox(width: value * 3);
  static SizedBox gx4 = SizedBox(width: value * 4);
  static SizedBox gx5 = SizedBox(width: value * 5);
  static SizedBox gx6 = SizedBox(width: value * 6);

  //endregion

  //region vertical
  static SizedBox gy1 = SizedBox(height: value * 1);
  static SizedBox gy2 = SizedBox(height: value * 2);
  static SizedBox gy3 = SizedBox(height: value * 3);
  static SizedBox gy4 = SizedBox(height: value * 4);
  static SizedBox gy5 = SizedBox(height: value * 5);
  static SizedBox gy6 = SizedBox(height: value * 6);

  //endregion

  //region misc
  static SizedBox none = const SizedBox();
  static Expanded infinity = const Expanded(child: SizedBox());
  static SizedBox infinityX = const SizedBox(width: double.maxFinite);
  static SizedBox infinityY = const SizedBox(height: double.maxFinite);
//endregion
}
