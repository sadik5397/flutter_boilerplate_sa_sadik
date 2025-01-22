import 'package:flutter/material.dart';

import '../theme/border_radius.dart';

class Link {
  static Widget widget({required Widget child, required void Function() onTap, BorderRadius? borderRadius, double? inkIntensity}) => Stack(children: [
    child,
    Positioned.fill(
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: borderRadius ?? ThemeBorderRadius.r3,
                hoverColor: Colors.black.withValues(alpha: inkIntensity ?? .075),
                highlightColor: Colors.black.withValues(alpha: inkIntensity ?? .075),
                splashColor: Colors.black.withValues(alpha: inkIntensity ?? .075),
                onTap: onTap)))
  ]);

  static Widget text({required String title, required void Function() onTap, BorderRadius? borderRadius, EdgeInsets? padding, TextStyle? style}) => Stack(children: [
    Padding(padding: padding ?? EdgeInsets.zero, child: Text(title, style: style)),
    Positioned.fill(
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                borderRadius: borderRadius ?? ThemeBorderRadius.r1,
                hoverColor: Colors.black.withValues(alpha: .075),
                highlightColor: Colors.black.withValues(alpha: .075),
                splashColor: Colors.black.withValues(alpha: .075),
                onTap: onTap)))
  ]);
}
