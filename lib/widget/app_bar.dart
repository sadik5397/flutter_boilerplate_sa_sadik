import 'package:flutter/material.dart';
import '../api/app_info.dart';
import '../theme/colors.dart';

class MyAppBar {
  static AppBar primary({String? title}) {
    return AppBar(centerTitle: true, backgroundColor: Colors.white, title: Text(title ?? MyAppInfo.appName, style: const TextStyle(fontWeight: FontWeight.w500)), foregroundColor: ThemeColor.primary);
  }
}
