import 'package:aosed_survey/api/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'border_radius.dart';
import 'colors.dart';
import 'padding.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

class ThemeDatePicker {
  static IconButton _icon(IconData icon, VoidCallback? onTap) => IconButton(onPressed: onTap, icon: Icon(icon), iconSize: 16, color: ThemeColor.jetBlack.withValues(alpha: .5));

  static DateRangeField dateRange({bool isDisable = false, DateRange? initialDateRange, required void Function(DateRange?) onDateRangeSelected}) {
    return DateRangeField(
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r2, borderSide: BorderSide(color: ThemeColor.primary.withValues(alpha: .3), width: 1)),
          enabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r2, borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r2, borderSide: BorderSide.none),
          labelText: "Select Date Range",
          isDense: true,
          alignLabelWithHint: true,
          filled: true,
          fillColor: isDisable ? ThemeColor.grey.withValues(alpha: .15) : ThemeColor.primaryLight,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: ThemePadding.px3,
          labelStyle: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w500),
          hintStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .5), fontSize: 14, fontWeight: FontWeight.normal),
          floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.w700),
          suffixIcon: _icon(Icons.calendar_month_sharp, null)),
      selectedDateRange: initialDateRange ?? DateRange(DateTime.now(), DateTime.now()),
      pickerBuilder: (BuildContext context, dynamic Function(DateRange?) onDateRangeChanged) => dateRangeWidget(initialDateRange: initialDateRange, onDateRangeSelected: onDateRangeSelected),
    );
  }

  static Padding dateRangeWidget({DateRange? initialDateRange, required void Function(DateRange?) onDateRangeSelected}) {
    return Padding(
        padding: ThemePadding.p2,
        child: DateRangePickerWidget(
            doubleMonth: true,
            maximumDateRangeLength: 365,
            minimumDateRangeLength: 1,
            initialDateRange: initialDateRange ?? DateRange(DateTime.now(), DateTime.now()),
            initialDisplayedDate: DateTime.now(),
            onDateRangeChanged: onDateRangeSelected));
  }

  static DatePicker singleDateFromTimeline({double? widgetHeight, DateTime? initialSelectedDate, DateTime? startDate, int? showDaysCount, required void Function(DateTime) onDateChange}) {
    return DatePicker(startDate ?? DateTime.now().subtract(const Duration(days: 2)),
        height: widgetHeight ?? 100,
        initialSelectedDate: initialSelectedDate ?? DateTime.now(),
        selectionColor: ThemeColor.primary,
        selectedTextColor: Colors.white,
        daysCount: showDaysCount ?? 21,
        inactiveDates: [(initialSelectedDate ?? DateTime.now()).subtract(const Duration(days: 2)), (initialSelectedDate ?? DateTime.now()).subtract(const Duration(days: 1))],
        deactivatedColor: ThemeColor.jetBlack.withValues(alpha: .4),
        onDateChange: onDateChange);
  }

  static Future<DateTime?> returnSingleDate({bool disablePastDays = false, DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
    FocusScope.of(globalContext).unfocus();
    return await showDatePicker(
        context: globalContext,
        initialDate: DateTime.now(),
        firstDate: disablePastDays ? DateTime.now() : firstDate ?? DateTime.now().subtract(const Duration(days: 365)),
        lastDate: lastDate ?? DateTime.now().add(const Duration(days: 365)));
  }
}
