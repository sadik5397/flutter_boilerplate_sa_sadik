import 'package:flutter/material.dart';

import '../api/constant.dart';

Future<dynamic> route(BuildContext context, Widget widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Future<dynamic> routeNoAnimation(BuildContext context, Widget widget) =>
    Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => widget, transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero));

Future<dynamic> routeNoBackNoAnimation(BuildContext context, Widget widget) =>
    Navigator.pushReplacement(context, PageRouteBuilder(pageBuilder: (context, animation1, animation2) => widget, transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero));

Future<dynamic> routeBack(BuildContext context, [String? result]) async => Navigator.pop(context, result);

Future<dynamic> routeNoBack(BuildContext context, Widget widget) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));

Future<Object?>? globalRoute(Widget widget) {
  return navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => widget));
}

Future<Object?>? globalRouteNoBack(Widget widget) {
  return navigatorKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) => widget));
}

Future<dynamic>? globalRouteBack([String? result]) async => Navigator.pop(navigatorKey.currentState!.context, result);

