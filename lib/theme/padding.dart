import 'package:flutter/material.dart';

import '../api/constant.dart';

class ThemePadding {
  static double value = Constant.unitMultiplier;

  //region all
  static EdgeInsets p1 = EdgeInsets.all(value * 1);
  static EdgeInsets p1_5 = EdgeInsets.all(value * 1.5);
  static EdgeInsets p2 = EdgeInsets.all(value * 2);
  static EdgeInsets p3 = EdgeInsets.all(value * 3);
  static EdgeInsets p4 = EdgeInsets.all(value * 4);
  static EdgeInsets p5 = EdgeInsets.all(value * 5);
  static EdgeInsets p6 = EdgeInsets.all(value * 6);
  static EdgeInsets p7 = EdgeInsets.all(value * 7);
  static EdgeInsets p8 = EdgeInsets.all(value * 8);
  //endregion

  //region horizontal
  static EdgeInsets px1 = EdgeInsets.symmetric(horizontal: value * 1);
  static EdgeInsets px2 = EdgeInsets.symmetric(horizontal: value * 2);
  static EdgeInsets px3 = EdgeInsets.symmetric(horizontal: value * 3);
  static EdgeInsets px4 = EdgeInsets.symmetric(horizontal: value * 4);
  static EdgeInsets px5 = EdgeInsets.symmetric(horizontal: value * 5);
  static EdgeInsets px6 = EdgeInsets.symmetric(horizontal: value * 6);
  static EdgeInsets px7 = EdgeInsets.symmetric(horizontal: value * 7);
  static EdgeInsets px8 = EdgeInsets.symmetric(horizontal: value * 8);
  //endregion

  //region vertical
  static EdgeInsets py1 = EdgeInsets.symmetric(vertical: value * 1);
  static EdgeInsets py2 = EdgeInsets.symmetric(vertical: value * 2);
  static EdgeInsets py3 = EdgeInsets.symmetric(vertical: value * 3);
  static EdgeInsets py4 = EdgeInsets.symmetric(vertical: value * 4);
  static EdgeInsets py5 = EdgeInsets.symmetric(vertical: value * 5);
  static EdgeInsets py6 = EdgeInsets.symmetric(vertical: value * 6);
  static EdgeInsets py7 = EdgeInsets.symmetric(vertical: value * 7);
  static EdgeInsets py8 = EdgeInsets.symmetric(vertical: value * 8);
  //endregion

  //region left
  static EdgeInsets pl1 = EdgeInsets.only(left: value * 1);
  static EdgeInsets pl2 = EdgeInsets.only(left: value * 2);
  static EdgeInsets pl3 = EdgeInsets.only(left: value * 3);
  static EdgeInsets pl4 = EdgeInsets.only(left: value * 4);
  static EdgeInsets pl5 = EdgeInsets.only(left: value * 5);
  static EdgeInsets pl6 = EdgeInsets.only(left: value * 6);
  static EdgeInsets pl7 = EdgeInsets.only(left: value * 7);
  static EdgeInsets pl8 = EdgeInsets.only(left: value * 8);
  //endregion

  //region right
  static EdgeInsets pr1 = EdgeInsets.only(right: value * 1);
  static EdgeInsets pr2 = EdgeInsets.only(right: value * 2);
  static EdgeInsets pr3 = EdgeInsets.only(right: value * 3);
  static EdgeInsets pr4 = EdgeInsets.only(right: value * 4);
  static EdgeInsets pr5 = EdgeInsets.only(right: value * 5);
  static EdgeInsets pr6 = EdgeInsets.only(right: value * 6);
  static EdgeInsets pr7 = EdgeInsets.only(right: value * 7);
  static EdgeInsets pr8 = EdgeInsets.only(right: value * 8);
  //endregion

  //region top
  static EdgeInsets pt1 = EdgeInsets.only(top: value * 1);
  static EdgeInsets pt2 = EdgeInsets.only(top: value * 2);
  static EdgeInsets pt3 = EdgeInsets.only(top: value * 3);
  static EdgeInsets pt4 = EdgeInsets.only(top: value * 4);
  static EdgeInsets pt5 = EdgeInsets.only(top: value * 5);
  static EdgeInsets pt6 = EdgeInsets.only(top: value * 6);
  static EdgeInsets pt7 = EdgeInsets.only(top: value * 7);
  static EdgeInsets pt8 = EdgeInsets.only(top: value * 8);
  //endregion

  //region bottom
  static EdgeInsets pb1 = EdgeInsets.only(bottom: value * 1);
  static EdgeInsets pb2 = EdgeInsets.only(bottom: value * 2);
  static EdgeInsets pb3 = EdgeInsets.only(bottom: value * 3);
  static EdgeInsets pb4 = EdgeInsets.only(bottom: value * 4);
  static EdgeInsets pb5 = EdgeInsets.only(bottom: value * 5);
  static EdgeInsets pb6 = EdgeInsets.only(bottom: value * 6);
  static EdgeInsets pb7 = EdgeInsets.only(bottom: value * 7);
  static EdgeInsets pb8 = EdgeInsets.only(bottom: value * 8);
  //endregion

  // region bottom
  static EdgeInsets none = EdgeInsets.zero;
  //endregion
}
