import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/padding.dart';

class ThemeHeading {
  static Padding h1(String title, {EdgeInsets? padding, Color? color, TextAlign? align}) => Padding(
      padding: padding ?? ThemePadding.p2, child: SelectableText(title, textAlign: align ?? TextAlign.start, style: TextStyle(color: color ?? ThemeColor.primary, fontWeight: FontWeight.bold, fontSize: 32)));

  static Padding h2(String title, {EdgeInsets? padding, Color? color, TextAlign? align}) => Padding(
      padding: padding ?? ThemePadding.p2, child: SelectableText(title, textAlign: align ?? TextAlign.start, style: TextStyle(color: color ?? ThemeColor.primary, fontWeight: FontWeight.bold, fontSize: 28)));

  static Padding h3(String title, {EdgeInsets? padding, Color? color, TextAlign? align}) => Padding(
      padding: padding ?? ThemePadding.p2, child: SelectableText(title, textAlign: align ?? TextAlign.start, style: TextStyle(color: color ?? ThemeColor.primary, fontWeight: FontWeight.bold, fontSize: 24)));

  static Padding h4(String title, {EdgeInsets? padding, Color? color, TextAlign? align}) => Padding(
      padding: padding ?? ThemePadding.p2, child: SelectableText(title, textAlign: align ?? TextAlign.start, style: TextStyle(color: color ?? ThemeColor.primary, fontWeight: FontWeight.bold, fontSize: 20)));

  static Padding h5(String title, {EdgeInsets? padding, Color? color, TextAlign? align}) => Padding(
      padding: padding ?? ThemePadding.p2, child: SelectableText(title, textAlign: align ?? TextAlign.start, style: TextStyle(color: color ?? ThemeColor.primary, fontWeight: FontWeight.normal, fontSize: 16)));

  static Padding h6(String title, {EdgeInsets? padding, Color? color, TextAlign? align}) => Padding(
      padding: padding ?? ThemePadding.p2, child: SelectableText(title, textAlign: align ?? TextAlign.start, style: TextStyle(color: color ?? ThemeColor.primary, fontWeight: FontWeight.normal, fontSize: 12)));

  static Padding textField(String title, {EdgeInsets? padding, Color? color, TextAlign? align}) => Padding(
      padding: padding ?? ThemePadding.none, child: SelectableText(title, textAlign: align ?? TextAlign.start, style: TextStyle(color: color ?? ThemeColor.jetBlack, fontWeight: FontWeight.w600, fontSize: 13)));

  static Padding basic(String title, {EdgeInsets? padding, Color? color, TextAlign? align}) => Padding(
      padding: padding ?? ThemePadding.none, child: SelectableText(title, textAlign: align ?? TextAlign.start, style: TextStyle(color: color ?? ThemeColor.jetBlack, fontWeight: FontWeight.w600, fontSize: 18)));
}
