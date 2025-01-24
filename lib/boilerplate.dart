import 'package:cached_network_image/cached_network_image.dart';
import '../api/constant.dart';
import '../theme/colors.dart';
import '../theme/heading.dart';
import '../theme/padding.dart';
import '../theme/text_field.dart';
import '../widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'api/app_info.dart';
import 'api/seed.dart';
import 'service/alert_message.dart';
import 'service/print.dart';
import 'service/snackbar_message.dart';
import 'theme/border_radius.dart';
import 'theme/button.dart';
import 'theme/dropdown_button.dart';
import 'theme/gap.dart';
import 'theme/no_data.dart';
import 'theme/shadow.dart';
import 'widget/datepicker.dart';

class Boilerplate extends StatelessWidget {
  const Boilerplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          //====================================================================================================
          CachedNetworkImage(imageUrl: MyAppInfo.appLogoUrl, height: 64),
          CachedNetworkImage(imageUrl: MyAppInfo.appLogoWideUrl, height: 44),
          Gap.gy4,
          //====================================================================================================
          ThemeHeading.h1("Heading 1"),
          ThemeHeading.h2("Heading 2"),
          ThemeHeading.h3("Heading 3"),
          ThemeHeading.h4("Heading 4"),
          ThemeHeading.h5("Heading 5"),
          ThemeHeading.h6("Heading 6"),
          Gap.gy4,
          //====================================================================================================
          Wrap(spacing: Constant.unitMultiplier * 2, runSpacing: Constant.unitMultiplier * 2, children: [
            Container(padding: ThemePadding.p3, color: ThemeColor.primary, child: Text("primary")),
            Container(padding: ThemePadding.p3, color: ThemeColor.primaryLight, child: Text("primaryLight")),
            Container(padding: ThemePadding.p3, color: ThemeColor.secondary, child: Text("secondary")),
            Container(padding: ThemePadding.p3, color: ThemeColor.alternate, child: Text("alternate")),
            Container(padding: ThemePadding.p3, color: ThemeColor.hover, child: Text("hover")),
            Container(padding: ThemePadding.p3, color: ThemeColor.backgroundLight, child: Text("backgroundLight")),
            Container(padding: ThemePadding.p3, color: ThemeColor.backgroundDark, child: Text("backgroundDark")),
            Container(padding: ThemePadding.p3, color: ThemeColor.jetBlack, child: Text("jetBlack")),
            Container(padding: ThemePadding.p3, color: ThemeColor.grey, child: Text("grey")),
            Container(padding: ThemePadding.p3, color: ThemeColor.success, child: Text("success")),
            Container(padding: ThemePadding.p3, color: ThemeColor.warning, child: Text("warning")),
            Container(padding: ThemePadding.p3, color: ThemeColor.danger, child: Text("danger")),
            Container(padding: ThemePadding.p3, color: ThemeColor.info, child: Text("info")),
            Container(padding: ThemePadding.p3, color: ThemeColor.neutral, child: Text("neutral")),
          ]),
          Gap.gy4,
          //====================================================================================================
          ThemeTextField.primary(labelText: "Primary TextField Label Text", controller: TextEditingController()), Gap.gy2,
          ThemeTextField.secondary(labelText: "Secondary TextField Label Text", controller: TextEditingController()), Gap.gy2,
          ThemeTextField.search(labelText: "Search TextField Label Text", controller: TextEditingController()), Gap.gy2,
          ThemeTextField.inLine(labelText: "InLine TextField Label Text", controller: TextEditingController()),
          Gap.gy4,
          //====================================================================================================
          ThemeDropDown.primary(title: "Primary Dropdown", options: Seed.randomNames, value: Seed.randomName, onChanged: (value) {}), Gap.gy2,
          ThemeDropDown.inline(title: "Inline Dropdown", options: Seed.randomNames, value: Seed.randomName, onChanged: (value) {}), Gap.gy2,
          ThemeDropDown.multiSelect(title: "MultiSelect", options: Seed.randomNames, values: Seed.randomNameList(2), onChanged: (value) {}),
          Gap.gy4,
          //====================================================================================================
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ThemeButton.primary(onTap: () {}, title: "1"),
            ThemeButton.secondary(onTap: () {}, title: "2"),
            ThemeButton.alternative(onTap: () {}, title: "3"),
            ThemeButton.border(onTap: () {}, title: "4")
          ]),
          Gap.gy4,
          //====================================================================================================
          ThemeButton.primary(onTap: () {}, title: "Primary Button"), Gap.gy1,
          ThemeButton.secondary(onTap: () {}, title: "Secondary Button"), Gap.gy1,
          ThemeButton.alternative(onTap: () {}, title: "Alternative Button"), Gap.gy1,
          ThemeButton.border(onTap: () {}, title: "Border Button"), Gap.gy1,
          ThemeButton.list(onTap: () {}, title: "List Button", icon: Icons.access_alarm_outlined), Gap.gy1,
          Gap.gy4,
          //====================================================================================================
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [NoData.loading(), NoData.empty(), NoData.progress(5, 10)]),
          Gap.gy4,
          //====================================================================================================
          Row(mainAxisAlignment: MainAxisAlignment.center, spacing: Constant.unitMultiplier, children: [
            ThemeButton.border(onTap: () => SnackBarMessage.show(label: "show"), title: "Snackbar"),
            ThemeButton.border(onTap: () => SnackBarMessage.info(label: "info"), title: "Info"),
            ThemeButton.border(onTap: () => SnackBarMessage.error(label: "error"), title: "Error")
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, spacing: Constant.unitMultiplier, children: [
            ThemeButton.border(onTap: () => SnackBarMessage.warning(label: "warning"), title: "Warning"),
            ThemeButton.border(onTap: () => SnackBarMessage.success(label: "success"), title: "Success")
          ]),
          Gap.gy4,
          //====================================================================================================
          Row(mainAxisAlignment: MainAxisAlignment.center, spacing: Constant.unitMultiplier, children: [
            ThemeButton.alternative(onTap: () => AlertMessage.show(label: "show"), title: "Quick Alert"),
            ThemeButton.alternative(onTap: () => AlertMessage.info(label: "info"), title: "Info"),
            ThemeButton.alternative(onTap: () => AlertMessage.error(label: "error"), title: "Error")
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, spacing: Constant.unitMultiplier, children: [
            ThemeButton.alternative(onTap: () => AlertMessage.warning(label: "warning"), title: "Warning"),
            ThemeButton.alternative(onTap: () => AlertMessage.success(label: "success"), title: "Success")
          ]),
          Gap.gy4,
          //====================================================================================================
          ThemeButton.border(onTap: () => MyDatePicker.dateRange(onDateRangeSelected: (p0) => Print.info(p0.toString())), title: "Date Picker"), Gap.gy1,
          Gap.gy4,
          //====================================================================================================
          Container(
            margin: ThemePadding.px6,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: ThemeColor.primaryLight, boxShadow: ThemeShadow.primary, borderRadius: ThemeBorderRadius.r4),
            child: Text("Primary BoxShadow\nThemeBorderRadius.r4", textAlign: TextAlign.center),
          ),
          Gap.gy6, Gap.gy6, Gap.gy6
        ]));
  }
}
