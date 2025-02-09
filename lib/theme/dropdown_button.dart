import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';

class ThemeDropDown {
  //region private props
  static Duration _searchDelay = Duration(milliseconds: 300);

  static MenuProps _dropDownMenuDecoration() => MenuProps(borderRadius: ThemeBorderRadius.r2);

  static Padding _optionsTitle({required String title}) => Padding(padding: ThemePadding.p4.copyWith(bottom: ThemePadding.value), child: Text("Select $title", textAlign: TextAlign.center));

  static TextFieldProps _searchField({required TextEditingController search}) => TextFieldProps(autofocus: true, controller: search, maxLines: 1, decoration: _searchTextFiledDecoration());

  static InputDecoration _searchTextFiledDecoration() => InputDecoration(
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

  static InputDecoration _dropDownDecoration({required String title, required bool enabled, String? errorText}) => InputDecoration(
      focusedBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r6, borderSide: BorderSide(width: 1, color: ThemeColor.primary)),
      enabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r6, borderSide: BorderSide(width: 1, color: ThemeColor.grey)),
      disabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r6, borderSide: BorderSide(width: 1, color: ThemeColor.grey)),
      labelText: title,
      helperText: errorText,
      helperStyle: TextStyle(color: ThemeColor.danger),
      alignLabelWithHint: true,
      filled: true,
      fillColor: !enabled ? Colors.black45 : Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: ThemePadding.px4,
      labelStyle: TextStyle(color: ThemeColor.grey, fontSize: 14, fontWeight: FontWeight.w500),
      hintText: "Select $title",
      hintStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .4), fontSize: 14, fontWeight: FontWeight.normal),
      floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.w500),
      isDense: true,
      enabled: enabled);

  static Container _itemDesign({required String item, required bool isSelected}) =>
      Container(color: isSelected ? ThemeColor.primaryLight : Colors.transparent, child: ListTile(title: Text(item, style: TextStyle(fontSize: 14, color: ThemeColor.jetBlack))));

  static DropdownButtonProps _dropDownIcon() => DropdownButtonProps(iconSize: 18, icon: Icon(Icons.keyboard_arrow_down), color: ThemeColor.jetBlack.withValues(alpha: .4));

  static DropDownDecoratorProps _decoratorProps({required String title, String? errorText, required bool isDisable}) => DropDownDecoratorProps(
      textAlignVertical: TextAlignVertical.center,
      dropdownSearchDecoration: _dropDownDecoration(title: title, enabled: !isDisable, errorText: errorText),
      baseStyle: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w400));

  static PopupPropsMultiSelection<dynamic> _multiSelectionMap({required String itemString, required String title, required bool useSearch}) {
    TextEditingController search = TextEditingController();
    return PopupPropsMultiSelection.menu(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
        itemBuilder: (context, item, isSelected) => _itemDesign(item: item[itemString], isSelected: isSelected),
        menuProps: _dropDownMenuDecoration(),
        searchDelay: _searchDelay,
        // disabledItemFn: (String s) => s.startsWith('I'),
        showSearchBox: useSearch,
        fit: FlexFit.loose,
        searchFieldProps: _searchField(search: search),
        title: _optionsTitle(title: title));
  }

  static PopupPropsMultiSelection<String> _multiSelectionString({required String title, required bool useSearch}) {
    TextEditingController search = TextEditingController();
    return PopupPropsMultiSelection.menu(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected) => _itemDesign(item: item, isSelected: isSelected),
        menuProps: _dropDownMenuDecoration(),
        searchDelay: _searchDelay,
        // disabledItemFn: (String s) => s.startsWith('I'),
        showSearchBox: useSearch,
        fit: FlexFit.loose,
        searchFieldProps: _searchField(search: search),
        title: _optionsTitle(title: title));
  }

  static PopupProps<dynamic> _singleSelectionMap({required String itemString, required String title, required bool useSearch}) {
    TextEditingController search = TextEditingController();
    return PopupProps.menu(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected) => _itemDesign(item: item[itemString], isSelected: isSelected),
        menuProps: _dropDownMenuDecoration(),
        searchDelay: _searchDelay,
        // disabledItemFn: (String s) => s.startsWith('I'),
        showSearchBox: useSearch,
        fit: FlexFit.loose,
        searchFieldProps: _searchField(search: search),
        title: _optionsTitle(title: title));
  }

  static PopupProps<String> _singleSelectionString({required String title, required bool useSearch}) {
    TextEditingController search = TextEditingController();
    return PopupProps.menu(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected) => _itemDesign(item: item, isSelected: isSelected),
        menuProps: _dropDownMenuDecoration(),
        searchDelay: _searchDelay,
        // disabledItemFn: (String s) => s.startsWith('I'),
        showSearchBox: useSearch,
        fit: FlexFit.loose,
        searchFieldProps: _searchField(search: search),
        title: _optionsTitle(title: title));
  }

//endregion

  static AbsorbPointer primary(
      {bool useSearch = true,
      isDisable = false,
      bool Function(String item, String filter)? filterFn,
      double? width,
      required String title,
      String? errorText,
      required List<String> options,
      required dynamic value,
      required void Function(Object? value) onChanged}) {
    return AbsorbPointer(
        absorbing: isDisable,
        child: DropdownSearch<String>(
            items: options,
            filterFn: filterFn,
            selectedItem: value,
            onChanged: onChanged,
            enabled: !isDisable,
            dropdownButtonProps: _dropDownIcon(),
            popupProps: _singleSelectionString(title: title, useSearch: useSearch),
            dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable)));
  }

  static AbsorbPointer map(
      {bool useSearch = true,
      isDisable = false,
      bool Function(dynamic item, String filter)? filterFn,
      double? width,
      required String title,
      itemString,
      String? errorText,
      required List<String> options,
      required dynamic value,
      required void Function(Object? value) onChanged}) {
    return AbsorbPointer(
        absorbing: isDisable,
        child: DropdownSearch<dynamic>(
            items: options,
            itemAsString: (item) => item[itemString],
            filterFn: filterFn,
            selectedItem: value,
            onChanged: onChanged,
            enabled: !isDisable,
            dropdownButtonProps: _dropDownIcon(),
            popupProps: _singleSelectionMap(title: title, useSearch: useSearch, itemString: itemString),
            dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable)));
  }

  static AbsorbPointer multiSelect(
      {bool useSearch = true,
      isDisable = false,
      bool Function(String item, String filter)? filterFn,
      double? width,
      required String title,
      String? errorText,
      required List<String> options,
      values,
      required void Function(Object? value) onChanged}) {
    return AbsorbPointer(
        absorbing: isDisable,
        child: DropdownSearch<String>.multiSelection(
            items: options,
            filterFn: filterFn,
            selectedItems: values,
            onChanged: onChanged,
            enabled: !isDisable,
            dropdownButtonProps: _dropDownIcon(),
            popupProps: _multiSelectionString(title: title, useSearch: useSearch),
            dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable)));
  }

  static AbsorbPointer multiSelectMap(
      {bool useSearch = true,
      isDisable = false,
      bool Function(dynamic item, String filter)? filterFn,
      double? width,
      required String title,
      itemString,
      String? errorText,
      required List<String> options,
      values,
      required void Function(Object? value) onChanged}) {
    return AbsorbPointer(
        absorbing: isDisable,
        child: DropdownSearch<dynamic>.multiSelection(
            items: options,
            itemAsString: (item) => item[itemString],
            filterFn: filterFn,
            selectedItems: values,
            onChanged: onChanged,
            enabled: !isDisable,
            dropdownButtonProps: _dropDownIcon(),
            popupProps: _multiSelectionMap(itemString: itemString, title: title, useSearch: useSearch),
            dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable)));
  }
}
