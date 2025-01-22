import 'package:flutter/material.dart';
import '../api/app_info.dart';
import '../api/constant.dart';
import '../theme/colors.dart';

enum AlertType { success, error, info, warning, none }

class SnackBarMessage {
  static SnackBar _snackbar({required AlertType type, BuildContext? context, required String label, String? title}) {
    return SnackBar(
        backgroundColor: type == AlertType.success
            ? ThemeColor.success
            : type == AlertType.error
                ? ThemeColor.danger
                : type == AlertType.info
                    ? ThemeColor.info
                    : type == AlertType.warning
                        ? ThemeColor.warning
                        : ThemeColor.primary,
        elevation: 0,
        dismissDirection: DismissDirection.vertical,
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(milliseconds: 3500),
        content: Text('${title ?? "Alert"}: $label', style: const TextStyle(fontWeight: FontWeight.w500), textAlign: TextAlign.start));
  }

  static error({BuildContext? context, required String label, String? title}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(_snackbar(type: AlertType.error, context: context, label: label, title: title ?? "Something went wrong"));
  }

  static success({BuildContext? context, required String label, String? title}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(_snackbar(type: AlertType.success, context: context, label: label, title: title ?? "Success"));
  }

  static warning({BuildContext? context, required String label, String? title}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(_snackbar(type: AlertType.warning, context: context, label: label, title: title ?? "Warning"));
  }

  static info({BuildContext? context, required String label, String? title}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(_snackbar(type: AlertType.info, context: context, label: label, title: title ?? "Information"));
  }

  static show({BuildContext? context, required String label, String? title}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
      ..hideCurrentSnackBar()
      ..showSnackBar(_snackbar(type: AlertType.none, context: context, label: label, title: title ?? MyAppInfo.appName));
  }
}
