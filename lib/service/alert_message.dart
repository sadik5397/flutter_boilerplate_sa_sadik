import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import '../api/app_info.dart';
import '../api/constant.dart';
import '../theme/border_radius.dart';
import '../theme/colors.dart';

enum AlertType { success, error, info, warning, none }

class AlertMessage {
  static Future _quickAlert(
      {required AlertType type, Widget? child, BuildContext? context, required String label, String? title, VoidCallback? onTap, String confirmBtnText = "OKAY", VoidCallback? onNoTap, String? cancelBtnText}) {
    return QuickAlert.show(
        context: navigatorKey.currentState!.context,
        width: Constant.alertWidth,
        type: type == AlertType.success
            ? QuickAlertType.success
            : type == AlertType.error
                ? QuickAlertType.error
                : type == AlertType.info
                    ? QuickAlertType.info
                    : type == AlertType.warning
                        ? QuickAlertType.warning
                        : QuickAlertType.confirm,
        borderRadius: ThemeBorderRadius.value * 3,
        animType: QuickAlertAnimType.slideInUp,
        title: title ?? MyAppInfo.appName,
        text: label,
        onConfirmBtnTap: onTap,
        confirmBtnText: confirmBtnText,
        showCancelBtn: cancelBtnText != null,
        onCancelBtnTap: onNoTap,
        cancelBtnText: cancelBtnText ?? "Cancel",
        backgroundColor: Colors.white,
        confirmBtnColor: ThemeColor.primary,
        widget: child,
        cancelBtnTextStyle: TextStyle(fontWeight: FontWeight.w500),
        confirmBtnTextStyle: TextStyle(fontWeight: FontWeight.w500),
        titleColor: type == AlertType.success
            ? ThemeColor.success
            : type == AlertType.error
                ? ThemeColor.danger
                : type == AlertType.info
                    ? ThemeColor.info
                    : type == AlertType.warning
                        ? ThemeColor.warning
                        : ThemeColor.primary,
        textColor: ThemeColor.jetBlack);
  }

  static error({BuildContext? context, required String label, String? title, Widget? child, VoidCallback? onTap, String? confirmBtnText, VoidCallback? onNoTap, String? cancelBtnText}) {
    return _quickAlert(type: AlertType.error, child: child, context: context, label: label, title: title ?? "Something went wrong");
  }

  static success({BuildContext? context, required String label, String? title, Widget? child, VoidCallback? onTap, String? confirmBtnText, VoidCallback? onNoTap, String? cancelBtnText}) {
    return _quickAlert(type: AlertType.success, child: child, context: context, label: label, title: title ?? "Success");
  }

  static warning({BuildContext? context, required String label, String? title, Widget? child, VoidCallback? onTap, String? confirmBtnText, VoidCallback? onNoTap, String? cancelBtnText}) {
    return _quickAlert(type: AlertType.warning, child: child, context: context, label: label, title: title ?? "Warning");
  }

  static info({BuildContext? context, required String label, String? title, Widget? child, VoidCallback? onTap, String? confirmBtnText, VoidCallback? onNoTap, String? cancelBtnText}) {
    return _quickAlert(type: AlertType.info, child: child, context: context, label: label, title: title ?? "Information");
  }

  static show({BuildContext? context, required String label, String? title, Widget? child, VoidCallback? onTap, String? confirmBtnText, VoidCallback? onNoTap, String? cancelBtnText}) {
    return _quickAlert(type: AlertType.none, child: child, context: context, label: label, title: title ?? MyAppInfo.appName);
  }
}
