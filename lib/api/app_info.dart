import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../theme/padding.dart';
import 'api.dart';

class MyAppInfo {
  static String appLogoWideUrl = "https://sadik.work/wp-content/uploads/2019/07/Asset-3@3x.png";
  static String appLogoWideAssetPath = "assets/logo-Wide.png";
  static String appLogoWideSvgAssetPath = "assets/logo-wide.svg";
  static String appLogoUrl = "https://sadik.work/wp-content/uploads/2020/01/cropped-Logo-512.png";
  static String appLogoAssetPath = "assets/logo.png";
  static String appLogoSvgAssetPath = "assets/logo.svg";
  static String appName = "S.a. Sadik App";
  static String version = "0.99.0";
  static String website = "www.sadik.work/app";
  static String footerNote = "© $appName ${DateTime.now().year} | All Rights Reserved";
  static String serverInfo = ApiConfig.baseUrl.contains("dev") ? "Development Server" : "Live Server";

  static InkWell appLogoWideWidget({EdgeInsets? padding, Color? color, bool navigateToHome = true, double? height}) => InkWell(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => navigateToHome ? {} : null,
      child: AnimatedPadding(
          duration: const Duration(milliseconds: 400),
          padding: padding ?? ThemePadding.none,
          child: Hero(tag: "App logo", child: CachedNetworkImage(imageUrl: appLogoWideUrl, fit: BoxFit.contain, height: height ?? 25, color: color))));
}
