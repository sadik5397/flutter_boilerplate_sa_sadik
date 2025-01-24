
import 'package:flutter/material.dart';
import 'border_radius.dart';
import 'colors.dart';
import 'hyperlink.dart';

class ThemeChip {
  static Widget _chip(
          {required String title, void Function()? onTap, EdgeInsets? padding, BorderRadius? borderRadius, required Color backgroundColor, required Color textColor, required BorderSide borderSide}) =>
      Hyperlink.widget(
          borderRadius: borderRadius ?? ThemeBorderRadius.r2,
          onTap: onTap ?? () {},
          child: Chip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            label: Text(title),
            backgroundColor: backgroundColor,
            labelStyle: TextStyle(color: textColor),
            padding: padding,
            shape: RoundedRectangleBorder(borderRadius: borderRadius ?? ThemeBorderRadius.r2, side: borderSide),
          ));

  static Widget primary({required String title, void Function()? onTap, EdgeInsets? padding, BorderRadius? borderRadius}) =>
      _chip(title: title, onTap: onTap, padding: padding, borderRadius: borderRadius, backgroundColor: ThemeColor.primary, textColor: Colors.white, borderSide: BorderSide(width: 0, color: Colors.transparent));

  static Widget secondary({required String title, void Function()? onTap, EdgeInsets? padding, BorderRadius? borderRadius}) => _chip(
      title: title, onTap: onTap, padding: padding, borderRadius: borderRadius, backgroundColor: ThemeColor.secondary, textColor: Colors.white, borderSide: BorderSide(width: 0, color: Colors.transparent));

  static Widget blank({required String title, void Function()? onTap, EdgeInsets? padding, BorderRadius? borderRadius}) => _chip(
      title: title,
      onTap: onTap,
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: ThemeColor.backgroundLight,
      textColor: ThemeColor.jetBlack,
      borderSide: BorderSide(width: 0, color: Colors.transparent));

  static Widget border({required String title, void Function()? onTap, EdgeInsets? padding, BorderRadius? borderRadius}) => _chip(
      title: title,
      onTap: onTap,
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: ThemeColor.primaryLight,
      textColor: ThemeColor.primary,
      borderSide: BorderSide(width: 1, color: ThemeColor.primary));
}
