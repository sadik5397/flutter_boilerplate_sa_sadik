import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/padding.dart';

class ThemeDropDown {
  //region private props
  static final Duration _searchDelay = const Duration(milliseconds: 300);

  static MenuProps _dropDownMenuDecoration() => MenuProps(borderRadius: ThemeBorderRadius.r2);

  static Padding _optionsTitle({required String title}) => Padding(padding: ThemePadding.p4.copyWith(bottom: ThemePadding.value), child: Text("Select $title", textAlign: TextAlign.center));

  static TextFieldProps _searchField() {
    TextEditingController searchController = TextEditingController();
    return TextFieldProps(autofocus: true, controller: searchController, maxLines: 1, decoration: _searchTextFiledDecoration());
  }

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
      helperText: errorText?.isNotEmpty == true ? errorText : null,
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

  static ClearButtonProps _clearButton(dynamic value, bool showClearButton) =>
      ClearButtonProps(isVisible: (value == null || value.isEmpty) ? false : showClearButton, iconSize: 18, icon: Icon(Icons.clear), color: ThemeColor.jetBlack.withValues(alpha: .4));

  static Text _dropDownValues(List selectedItems, {String? itemString}) =>
      Text(itemString == null ? selectedItems.join(", ") : (List.generate(selectedItems.length, (index) => selectedItems[index][itemString])).join(", "),
          style: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w400), maxLines: 1, overflow: TextOverflow.ellipsis);

  static DropDownDecoratorProps _decoratorProps({required String title, String? errorText, required bool isDisable}) => DropDownDecoratorProps(
      textAlignVertical: TextAlignVertical.center,
      dropdownSearchDecoration: _dropDownDecoration(title: title, enabled: !isDisable, errorText: errorText),
      baseStyle: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w400));

  static PopupPropsMultiSelection<dynamic> _multiSelectionMap({required String itemString, required String title, required bool useSearch}) {
    return PopupPropsMultiSelection.menu(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected) => _itemDesign(item: item[itemString], isSelected: isSelected),
        menuProps: _dropDownMenuDecoration(),
        searchDelay: _searchDelay,
        // disabledItemFn: (String s) => s.startsWith('I'),
        showSearchBox: useSearch,
        fit: FlexFit.loose,
        searchFieldProps: _searchField(),
        title: _optionsTitle(title: title));
  }

  static PopupPropsMultiSelection<String> _multiSelectionString({required String title, required bool useSearch}) {
    return PopupPropsMultiSelection.menu(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected) => _itemDesign(item: item, isSelected: isSelected),
        menuProps: _dropDownMenuDecoration(),
        searchDelay: _searchDelay,
        // disabledItemFn: (String s) => s.startsWith('I'),
        showSearchBox: useSearch,
        fit: FlexFit.loose,
        searchFieldProps: _searchField(),
        title: _optionsTitle(title: title));
  }

  static PopupProps<dynamic> _singleSelectionMap({required String title, required String itemString, required bool useSearch}) {
    return PopupProps.menu(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected) => _itemDesign(item: item[itemString], isSelected: isSelected),
        menuProps: _dropDownMenuDecoration(),
        searchDelay: _searchDelay,
        // disabledItemFn: (String s) => s.startsWith('I'),
        showSearchBox: useSearch,
        fit: FlexFit.loose,
        searchFieldProps: _searchField(),
        title: _optionsTitle(title: title));
  }

  static PopupProps<String> _singleSelectionString({required String title, required bool useSearch}) {
    return PopupProps.menu(
        constraints: const BoxConstraints(maxHeight: 600, maxWidth: 300),
        showSelectedItems: true,
        itemBuilder: (context, item, isSelected) => _itemDesign(item: item, isSelected: isSelected),
        menuProps: _dropDownMenuDecoration(),
        searchDelay: _searchDelay,
        // disabledItemFn: (String s) => s.startsWith('I'),
        showSearchBox: useSearch,
        fit: FlexFit.loose,
        searchFieldProps: _searchField(),
        title: _optionsTitle(title: title));
  }

//endregion

  static DropdownSearch primary(
      {bool useSearch = true,
      isDisable = false,
      bool Function(String item, String filter)? filterFn,
      bool showClearButton = true,
      double? width,
      required String title,
      String? errorText,
      required List<String> options,
      required dynamic value,
      required void Function(Object? value) onChanged}) {
    return DropdownSearch<String>(
        items: options,
        filterFn: filterFn,
        selectedItem: value,
        onChanged: onChanged,
        enabled: !isDisable,
        dropdownButtonProps: _dropDownIcon(),
        popupProps: _singleSelectionString(title: title, useSearch: useSearch),
        clearButtonProps: _clearButton(value, showClearButton),
        dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable));
  }

  static DropdownSearch map(
      {bool useSearch = true,
      isDisable = false,
      bool Function(dynamic item, String filter)? filterFn,
      bool showClearButton = true,
      double? width,
      required String title,
      required String itemString,
      String? errorText,
      required List<dynamic> options,
      required dynamic value,
      required void Function(Object? value) onChanged}) {
    return DropdownSearch<dynamic>(
        items: options.where((option) => option != null).toList(),
        itemAsString: (item) => item[itemString],
        compareFn: (item, selectedItem) => item == null ? false : (item[itemString] == selectedItem[itemString]),
        filterFn: filterFn,
        selectedItem: value,
        onChanged: onChanged,
        enabled: !isDisable,
        popupProps: _singleSelectionMap(title: title, useSearch: useSearch, itemString: itemString),
        dropdownButtonProps: _dropDownIcon(),
        clearButtonProps: _clearButton(value, showClearButton),
        dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable));
  }

  static DropdownSearch multiSelect(
      {bool useSearch = true,
      isDisable = false,
      bool Function(String item, String filter)? filterFn,
      bool showClearButton = true,
      double? width,
      required String title,
      String? errorText,
      required List<String> options,
      List<String>? values,
      required void Function(Object? value) onChanged}) {
    return (values?.isEmpty ?? true)
        ? DropdownSearch<String>.multiSelection(
            items: options,
            filterFn: filterFn,
            selectedItems: [],
            onChanged: onChanged,
            enabled: !isDisable,
            dropdownButtonProps: _dropDownIcon(),
            popupProps: _multiSelectionString(title: title, useSearch: useSearch),
            clearButtonProps: _clearButton(values, showClearButton),
            dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable))
        : DropdownSearch<String>.multiSelection(
            dropdownBuilder: (context, selectedItems) => _dropDownValues(selectedItems),
            items: options,
            filterFn: filterFn,
            selectedItems: values!,
            onChanged: onChanged,
            enabled: !isDisable,
            dropdownButtonProps: _dropDownIcon(),
            popupProps: _multiSelectionString(title: title, useSearch: useSearch),
            clearButtonProps: _clearButton(values, showClearButton),
            dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable));
  }

  static DropdownSearch multiSelectMap(
      {bool useSearch = true,
      isDisable = false,
      bool Function(dynamic item, String filter)? filterFn,
      bool showClearButton = true,
      double? width,
      required String title,
      required String itemString,
      String? errorText,
      required List<dynamic> options,
      List<String>? values,
      required void Function(Object? value) onChanged}) {
    return (values?.isEmpty ?? true)
        ? DropdownSearch<dynamic>.multiSelection(
            items: options.where((option) => option != null).toList(),
            itemAsString: (item) => item[itemString],
            compareFn: (item, selectedItem) => item == null ? false : (item[itemString] == selectedItem[itemString]),
            filterFn: filterFn,
            selectedItems: [],
            onChanged: onChanged,
            enabled: !isDisable,
            dropdownButtonProps: _dropDownIcon(),
            popupProps: _multiSelectionMap(itemString: itemString, title: title, useSearch: useSearch),
            clearButtonProps: _clearButton(values, showClearButton),
            dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable))
        : DropdownSearch<dynamic>.multiSelection(
            dropdownBuilder: (context, selectedItems) => _dropDownValues(selectedItems, itemString: itemString),
            items: options.where((option) => option != null).toList(),
            itemAsString: (item) => item[itemString],
            compareFn: (item, selectedItem) => item == null ? false : (item[itemString] == selectedItem[itemString]),
            filterFn: filterFn,
            selectedItems: values!,
            onChanged: onChanged,
            enabled: !isDisable,
            dropdownButtonProps: _dropDownIcon(),
            popupProps: _multiSelectionMap(itemString: itemString, title: title, useSearch: useSearch),
            clearButtonProps: _clearButton(values, showClearButton),
            dropdownDecoratorProps: _decoratorProps(title: title, errorText: errorText, isDisable: isDisable));
  }
}
