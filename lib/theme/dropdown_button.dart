import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';

class ThemeDropDown {
  static AbsorbPointer primary(
      {bool useSearch = true,
      double? width,
      bool isDisable = false,
      bool Function(String item, String filter)? filterFn,
      required String title,
      required List<String> options,
      required dynamic value,
      required void Function(Object? value) onChanged}) {
    TextEditingController search = TextEditingController();
    return AbsorbPointer(
        absorbing: isDisable,
        child: DropdownSearch<String>(
            items: options,
            // itemAsString: (item) =>"$item$item",
            filterFn: filterFn,
            selectedItem: value,
            onChanged: onChanged,
            enabled: !isDisable,
            validator: (String? item) => item == null ? "Required field" : null,
            popupProps: PopupProps.menu(
                constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
                showSelectedItems: true,
                itemBuilder: (context, item, isSelected) => Container(
                    color: isSelected ? ThemeColor.primaryLight : Colors.transparent,
                    child: ListTile(title: Text(item, style: TextStyle(fontSize: 14, color: isSelected ? ThemeColor.primary : ThemeColor.jetBlack)))),
                menuProps: MenuProps(borderRadius: ThemeBorderRadius.r2),
                searchDelay: const Duration(milliseconds: 300),
                // disabledItemFn: (String s) => s.startsWith('I'),
                showSearchBox: useSearch,
                fit: FlexFit.loose,
                searchFieldProps: TextFieldProps(autofocus: true, controller: search, maxLines: 1, decoration: searchTextFiledDecoration()),
                title: Padding(padding: ThemePadding.p4.copyWith(bottom: ThemePadding.value), child: Text("Select $title", textAlign: TextAlign.center))),
            dropdownDecoratorProps: DropDownDecoratorProps(textAlignVertical: TextAlignVertical.center, dropdownSearchDecoration: dropDownDecoration(title: title, enabled: !isDisable)),
            dropdownButtonProps: const DropdownButtonProps(),
            clearButtonProps: const ClearButtonProps(),
            dropdownBuilder: (context, selectedItem) => Row(children: [
                  Text("$title: ", style: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .6), fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(selectedItem ?? "", style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.normal))
                ])));
  }

  static Column inline(
      {bool useSearch = true,
      double? width,
      bool isDisable = false,
      EdgeInsets? padding,
      bool Function(String item, String filter)? filterFn,
      required String title,
      String? helperText,
      required List<String> options,
      required dynamic value,
      required void Function(Object? value) onChanged}) {
    TextEditingController search = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AbsorbPointer(
            absorbing: isDisable,
            child: DropdownSearch<String>(
                items: options,
                // itemAsString: (item) =>"$item$item",
                filterFn: filterFn,
                selectedItem: value,
                onChanged: onChanged,
                enabled: !isDisable,
                validator: (String? item) => item == null ? "Required field" : null,
                popupProps: PopupProps.menu(
                    constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
                    containerBuilder: (context, popupWidget) => Container(decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r1), child: popupWidget),
                    showSelectedItems: true,
                    itemBuilder: (context, item, isSelected) => Container(
                        color: isSelected ? ThemeColor.primaryLight.withValues(alpha: .5) : Colors.transparent,
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: ThemePadding.value * 3, horizontal: ThemePadding.value * 4),
                            child: Text(item, style: TextStyle(fontSize: 13, color: isSelected ? ThemeColor.primary : ThemeColor.jetBlack, fontWeight: FontWeight.w500)))),
                    menuProps: MenuProps(borderRadius: ThemeBorderRadius.r1),
                    searchDelay: const Duration(milliseconds: 300),
                    // disabledItemFn: (String s) => s.startsWith('I'),
                    showSearchBox: useSearch,
                    fit: FlexFit.loose,
                    searchFieldProps: TextFieldProps(
                        controller: search,
                        padding: ThemePadding.p4,
                        style: TextStyle(color: ThemeColor.jetBlack, fontSize: 12, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        decoration: searchTextFiledDecoration()),
                    title: Padding(
                        padding: ThemePadding.p4.copyWith(bottom: ThemePadding.value),
                        child: Text("Select $title", textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12)))),
                dropdownDecoratorProps: DropDownDecoratorProps(textAlignVertical: TextAlignVertical.center, dropdownSearchDecoration: dropDownDecoration(title: title, enabled: !isDisable)),
                dropdownButtonProps: DropdownButtonProps(color: ThemeColor.jetBlack.withValues(alpha: .4)),
                clearButtonProps: const ClearButtonProps(),
                dropdownBuilder: (context, selectedItem) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Gap.gy3,
                      Text(title, style: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .65), fontSize: 11, fontWeight: FontWeight.w600)),
                      Gap.gy1,
                      Text(selectedItem ?? "--Select--",
                          style: TextStyle(color: selectedItem == null ? ThemeColor.jetBlack.withValues(alpha: .4) : ThemeColor.jetBlack, fontSize: 12, fontWeight: FontWeight.w400)),
                      SizedBox(height: Gap.value * 3.25)
                    ]))),
        if (helperText != null) Gap.gy2,
        if (helperText != null) Text(helperText, style: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .7), fontSize: 11, fontWeight: FontWeight.normal))
      ]
    );
  }

  static AbsorbPointer map(
      {bool useSearch = true,
      double? width,
      bool isDisable = false,
      EdgeInsets? padding,
      bool Function(dynamic item, String filter)? filterFn,
      required String title,
      required String itemString,
      required List<dynamic> options,
      required dynamic value,
      required void Function(Object? value) onChanged}) {
    TextEditingController search = TextEditingController();
    return AbsorbPointer(
        absorbing: isDisable,
        child: DropdownSearch<dynamic>(
            items: options,
            itemAsString: (item) => item[itemString],
            filterFn: filterFn,
            selectedItem: value,
            onChanged: onChanged,
            enabled: !isDisable,
            validator: (item) => item == null ? "Required field" : null,
            popupProps: PopupProps.menu(
                constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
                itemBuilder: (context, item, isSelected) => Container(
                    color: isSelected ? ThemeColor.primaryLight : Colors.transparent,
                    child: ListTile(title: Text(item[itemString], style: TextStyle(fontSize: 14, color: isSelected ? ThemeColor.primary : ThemeColor.jetBlack)))),
                menuProps: MenuProps(borderRadius: ThemeBorderRadius.r2),
                searchDelay: const Duration(milliseconds: 300),
                // disabledItemFn: (String s) => s.startsWith('I'),
                showSearchBox: useSearch,
                fit: FlexFit.loose,
                searchFieldProps: TextFieldProps(autofocus: true, controller: search, maxLines: 1, decoration: searchTextFiledDecoration()),
                title: Padding(padding: ThemePadding.p4.copyWith(bottom: ThemePadding.value), child: Text("Select $title", textAlign: TextAlign.center))),
            dropdownDecoratorProps: DropDownDecoratorProps(textAlignVertical: TextAlignVertical.center, dropdownSearchDecoration: dropDownDecoration(title: title, enabled: !isDisable)),
            dropdownButtonProps: const DropdownButtonProps(),
            clearButtonProps: const ClearButtonProps(),
            dropdownBuilder: (context, selectedItem) => Row(children: [
                  Text("$title: ", style: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .6), fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(selectedItem?[itemString] ?? "", style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.normal))
                ])));
  }

  static AbsorbPointer multiSelect(
      {bool useSearch = true,
      double? width,
      bool isDisable = false,
      EdgeInsets? padding,
      bool Function(String item, String filter)? filterFn,
      required String title,
      required List<String> options,
      required List<String> values,
      required void Function(Object? value) onChanged}) {
    TextEditingController search = TextEditingController();
    return AbsorbPointer(
        absorbing: isDisable,
        child: DropdownSearch<String>.multiSelection(
            items: options,
            // itemAsString: (item) =>"$item$item",
            filterFn: filterFn,
            selectedItems: values,
            onChanged: onChanged,
            enabled: !isDisable,
            validator: (List<String>? item) => item == null ? "Required field" : null,
            popupProps: PopupPropsMultiSelection.menu(
                constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
                showSelectedItems: true,
                itemBuilder: (context, item, isSelected) => Container(
                    color: isSelected ? ThemeColor.primaryLight : Colors.transparent,
                    child: ListTile(title: Text(item, style: TextStyle(fontSize: 14, color: isSelected ? ThemeColor.primary : ThemeColor.jetBlack)))),
                menuProps: MenuProps(borderRadius: ThemeBorderRadius.r2),
                searchDelay: const Duration(milliseconds: 300),
                // disabledItemFn: (String s) => s.startsWith('I'),
                showSearchBox: useSearch,
                fit: FlexFit.loose,
                searchFieldProps: TextFieldProps(autofocus: true, controller: search, maxLines: 1, decoration: searchTextFiledDecoration()),
                title: Padding(padding: ThemePadding.p4.copyWith(bottom: ThemePadding.value), child: Text("Select $title", textAlign: TextAlign.center))),
            dropdownDecoratorProps: DropDownDecoratorProps(textAlignVertical: TextAlignVertical.center, dropdownSearchDecoration: dropDownDecoration(title: title, enabled: !isDisable)),
            dropdownButtonProps: const DropdownButtonProps(),
            clearButtonProps: const ClearButtonProps(),
            dropdownBuilder: (context, selectedItem) => Row(children: [
                  Text("$title: ", style: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .6), fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(selectedItem.toString().replaceAll("[", "").replaceAll("]", ""), style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.normal))
                ])));
  }

  static AbsorbPointer multiSelectMap(
      {bool useSearch = true,
      double? width,
      bool isDisable = false,
      EdgeInsets? padding,
      bool Function(dynamic item, String filter)? filterFn,
      required String title,
      required String itemString,
      required List<dynamic> options,
      required List<dynamic> values,
      required void Function(Object? value) onChanged}) {
    TextEditingController search = TextEditingController();
    return AbsorbPointer(
        absorbing: isDisable,
        child: DropdownSearch<dynamic>.multiSelection(
            items: options,
            itemAsString: (item) => item[itemString],
            filterFn: filterFn,
            selectedItems: values,
            onChanged: onChanged,
            enabled: !isDisable,
            validator: (List<dynamic>? item) => item == null ? "Required field" : null,
            popupProps: PopupPropsMultiSelection.menu(
                constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
                itemBuilder: (context, item, isSelected) => Container(
                    color: isSelected ? ThemeColor.primaryLight : Colors.transparent,
                    child: ListTile(title: Text(item[itemString], style: TextStyle(fontSize: 14, color: isSelected ? ThemeColor.primary : ThemeColor.jetBlack)))),
                menuProps: MenuProps(borderRadius: ThemeBorderRadius.r2),
                searchDelay: const Duration(milliseconds: 300),
                // disabledItemFn: (String s) => s.startsWith('I'),
                showSearchBox: useSearch,
                fit: FlexFit.loose,
                searchFieldProps: TextFieldProps(autofocus: true, controller: search, maxLines: 1, decoration: searchTextFiledDecoration()),
                title: Padding(padding: ThemePadding.p4.copyWith(bottom: ThemePadding.value), child: Text("Select $title", textAlign: TextAlign.center))),
            dropdownDecoratorProps: DropDownDecoratorProps(textAlignVertical: TextAlignVertical.center, dropdownSearchDecoration: dropDownDecoration(title: title, enabled: !isDisable)),
            dropdownButtonProps: const DropdownButtonProps(),
            clearButtonProps: const ClearButtonProps(),
            dropdownBuilder: (context, selectedItem) => Row(children: [
                  Text("$title: ", style: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .6), fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(selectedItem.map((item) => item[itemString]).join(', '), style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.normal))
                ])));
  }
}

InputDecoration searchTextFiledDecoration() => InputDecoration(
    focusedBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide(color: ThemeColor.primary.withValues(alpha: .3), width: 1)),
    enabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none),
    disabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none),
    hintText: "Search Here",
    isDense: true,
    filled: true,
    fillColor: ThemeColor.primary.withValues(alpha: .05),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: EdgeInsets.symmetric(horizontal: ThemePadding.value * 3, vertical: ThemePadding.value),
    hintStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .5), fontSize: 12, fontWeight: FontWeight.normal),
    suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.search), iconSize: 16, color: ThemeColor.jetBlack.withValues(alpha: .5)));

InputDecoration dropDownDecoration({required String title, required bool enabled}) => InputDecoration(
    focusedBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide(width: 1, color: ThemeColor.jetBlack.withValues(alpha: .3))),
    enabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide(width: 1, color: ThemeColor.jetBlack.withValues(alpha: .3))),
    disabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide(width: 1, color: ThemeColor.jetBlack.withValues(alpha: .3))),
    isDense: true,
    alignLabelWithHint: true,
    filled: true,
    fillColor: !enabled ? Colors.black45 : ThemeColor.backgroundLight,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabled: enabled,
    contentPadding: ThemePadding.px3,
    labelStyle: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w500),
    hintText: title,
    hintStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .4), fontSize: 12, fontWeight: FontWeight.normal),
    floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontSize: 14, fontWeight: FontWeight.w500));
