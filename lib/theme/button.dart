import 'package:flutter/material.dart';
import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import 'padding.dart';

class ThemeButton {
  static Widget primary({String? title, IconData? icon, required VoidCallback onTap, bool isLoading = false}) => ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r2),
          backgroundColor: ThemeColor.primary,
          elevation: 0,
          padding: ThemePadding.p3.copyWith(left: ThemePadding.value * 6, right: ThemePadding.value * 6)),
      child: isLoading
          ? Container(width: 20, height: 20, margin: ThemePadding.px5 * 2, padding: ThemePadding.p1, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text(title ?? "Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)), Gap.gx2, Icon(icon ?? Icons.chevron_right_rounded, color: Colors.white, size: 16)]));

  static Widget primaryLight({String? title, IconData? icon, required VoidCallback onTap, bool isLoading = false}) => ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r2),
          backgroundColor: ThemeColor.primaryLight,
          elevation: 0,
          padding: ThemePadding.p3.copyWith(left: ThemePadding.value * 6, right: ThemePadding.value * 6)),
      child: isLoading
          ? Container(width: 20, height: 20, margin: ThemePadding.px5 * 2, padding: ThemePadding.p1, child: CircularProgressIndicator(color: ThemeColor.primary, strokeWidth: 2))
          : Row(mainAxisSize: MainAxisSize.min, children: [
              Text(title ?? "Submit", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.w500)),
              Gap.gx2,
              Icon(icon ?? Icons.chevron_right_rounded, color: ThemeColor.primary, size: 16)
            ]));

  static Widget secondary({String? title, IconData? icon, required VoidCallback onTap, bool isLoading = false}) => ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r2),
          backgroundColor: ThemeColor.secondary,
          elevation: 0,
          padding: ThemePadding.p3.copyWith(left: ThemePadding.value * 6, right: ThemePadding.value * 6)),
      child: isLoading
          ? Container(width: 20, height: 20, margin: ThemePadding.px5 * 2, padding: ThemePadding.p1, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : Row(mainAxisSize: MainAxisSize.min, children: [
              Text(title ?? "Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              Gap.gx2,
              Icon(icon ?? Icons.chevron_right_rounded, color: Colors.white, size: 16)
            ]));

  static Widget alternative({String? title, IconData? icon, required VoidCallback onTap, bool isLoading = false}) => ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r2),
          backgroundColor: ThemeColor.alternate,
          elevation: 0,
          padding: ThemePadding.p3.copyWith(left: ThemePadding.value * 6, right: ThemePadding.value * 6)),
      child: isLoading
          ? Container(width: 20, height: 20, margin: ThemePadding.px5 * 2, padding: ThemePadding.p1, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text(title ?? "Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)), Gap.gx2, Icon(icon ?? Icons.chevron_right_rounded, color: Colors.white, size: 16)]));

  static Widget border({String? title, IconData? icon, required VoidCallback onTap, bool isLoading = false}) => ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r2, side: BorderSide(color: ThemeColor.primary.withValues(alpha: .3), width: 1)),
          backgroundColor: ThemeColor.primaryLight,
          elevation: 0,
          padding: ThemePadding.p3.copyWith(left: ThemePadding.value * 6, right: ThemePadding.value * 6)),
      child: isLoading
          ? Container(width: 20, height: 20, margin: ThemePadding.px5 * 2, padding: ThemePadding.p1, child: CircularProgressIndicator(color: ThemeColor.primary, strokeWidth: 2))
          : Row(mainAxisSize: MainAxisSize.min, children: [
              Text(title ?? "Submit", style: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.w500)),
              Gap.gx2,
              Icon(icon ?? Icons.chevron_right_rounded, color: ThemeColor.primary, size: 16)
            ]));

  static Widget list({String? title, IconData? icon, VoidCallback? onTap, VoidCallback? onDelete, String? infoKey, String? infoValue}) => ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: ThemeBorderRadius.r2),
        backgroundColor: ThemeColor.primaryLight,
        elevation: 0,
        padding: ThemePadding.p3.copyWith(right: ThemePadding.value),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Gap.gx2,
        CircleAvatar(
            radius: 16,
            backgroundColor: ThemeColor.primary.withValues(alpha: .2),
            child: icon == null ? Text(title![0], style: TextStyle(color: ThemeColor.primary)) : Icon(icon, color: ThemeColor.primary, size: 16)),
        Gap.gx4,
        Expanded(
            child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(title ?? "(Invalid)", textAlign: TextAlign.start, style: TextStyle(color: ThemeColor.jetBlack, fontWeight: FontWeight.w500)),
          Gap.gx2,
          if (infoKey != null) Text('$infoKey: ', style: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .5), fontWeight: FontWeight.normal)),
          if (infoValue != null) Text(infoValue, style: TextStyle(color: ThemeColor.jetBlack, fontWeight: FontWeight.normal))
        ])),
        if (onDelete == null) Padding(padding: ThemePadding.px4, child: const Icon(Icons.chevron_right)),
        if (onDelete != null) Padding(padding: ThemePadding.px2, child: IconButton(icon: const Icon(Icons.delete_forever_outlined, color: ThemeColor.danger), onPressed: onDelete))
      ]));
}
