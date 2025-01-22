import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../api/constant.dart';
import 'colors.dart';

class NoData {
  static Widget loading() => Container(alignment: Alignment.center, child: CircularProgressIndicator(color: ThemeColor.primary));

  static Widget empty() => Center(child: SizedBox(width: Constant.alertWidth / 2, child: Lottie.asset("assets/noData.json", fit: BoxFit.contain)));

  static Widget progress(num value, num total) => Container(alignment: Alignment.center, child: CircularProgressIndicator(color: ThemeColor.primary, value: value / total));
}
