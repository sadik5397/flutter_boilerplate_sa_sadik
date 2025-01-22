import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/border_radius.dart';
import '../theme/colors.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';

class ThemeTextField {
  static Icon _pIcon(IconData icon) => Icon(icon, size: 16, color: ThemeColor.primary);

  static IconButton _sIcon(IconData icon, VoidCallback? onTap) => IconButton(onPressed: onTap, icon: Icon(icon), iconSize: 14, color: ThemeColor.jetBlack.withValues(alpha: .4));

  static TextFormField primary(
      {required String labelText,
      bool isPassword = false,
      bool inLine = false,
      IconData? icon,
      bool isDate = false,
      bool isFile = false,
      bool hasSubmitButton = false,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      required TextEditingController controller,
      bool autoFocus = false,
      FocusNode? focusNode,
      String errorText = "This field should not be empty",
      bool required = false,
      String autofillHints = "",
      String? helperText,
      bool showPassword = false,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      VoidCallback? showPasswordPressed,
      VoidCallback? onFieldSubmittedAlternate,
      VoidCallback? onTap,
      Function(String value)? onChange,
      Function(String value)? onFieldSubmitted,
      int maxLines = 1,
      int? maxLength,
      bool showLabel = true,
      bool floatLabel = true,
      bool readOnly = false,
      bool centerAlign = false,
      bool isDisable = false}) {
    return TextFormField(
        readOnly: (isDate || isFile || readOnly),
        showCursor: !(isDate || isFile || readOnly),
        onTap: onTap,
        maxLines: maxLines,
        autofillHints: [autofillHints],
        focusNode: focusNode,
        textAlign: centerAlign ? TextAlign.center : TextAlign.start,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChange,
        keyboardType: maxLines == 1 ? keyboardType : TextInputType.multiline,
        inputFormatters: keyboardType == TextInputType.number ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly] : null,
        textCapitalization: textCapitalization,
        obscureText: (isPassword) ? !showPassword : false,
        controller: controller,
        style: TextStyle(color: ThemeColor.jetBlack, fontSize: 12, fontWeight: FontWeight.w400),
        maxLength: maxLength,
        autofocus: autoFocus,
        enabled: !isDisable,
        validator: (value) => required
            ? value == null || value.isEmpty
                ? errorText
                : null
            : null,
        decoration: InputDecoration(
            focusedBorder:
                floatLabel ? OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none) : UnderlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none),
            enabledBorder:
                floatLabel ? OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none) : UnderlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none),
            disabledBorder:
                floatLabel ? OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none) : UnderlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none),
            labelText: showLabel ? labelText : null,
            helperText: helperText,
            isDense: true,
            alignLabelWithHint: true,
            filled: true,
            fillColor: isDisable ? Colors.black45 : ThemeColor.backgroundLight,
            floatingLabelBehavior: floatLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.always,
            contentPadding: maxLines == 1 ? ThemePadding.px3 : ThemePadding.px3.copyWith(top: ThemePadding.value * 7),
            labelStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .65), fontSize: 12, fontWeight: FontWeight.w400),
            hintText: showLabel ? hintText : labelText,
            hintStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .4), fontSize: 12, fontWeight: FontWeight.normal),
            floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.w500),
            prefixIcon: icon == null ? null : _pIcon(icon),
            suffixIcon: readOnly
                ? _sIcon(Icons.lock_outlined, null)
                : isPassword
                    ? _sIcon(showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, showPasswordPressed)
                    : (isDate)
                        ? _sIcon(Icons.calendar_month_sharp, null)
                        : (isFile)
                            ? _sIcon(Icons.attach_file_rounded, null)
                            : (hasSubmitButton)
                                ? _sIcon(Icons.adaptive.arrow_forward, onFieldSubmittedAlternate)
                                : _sIcon(Icons.cancel_outlined, () => controller.clear())));
  }

  static TextFormField secondary(
      {required String labelText,
      bool isPassword = false,
      bool inLine = false,
      EdgeInsets? padding,
      IconData? icon,
      bool isDate = false,
      bool isFile = false,
      bool hasSubmitButton = false,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      required TextEditingController controller,
      bool autoFocus = false,
      FocusNode? focusNode,
      String errorText = "This field should not be empty",
      bool required = false,
      String autofillHints = "",
      String? helperText,
      bool showPassword = false,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      VoidCallback? showPasswordPressed,
      VoidCallback? onFieldSubmittedAlternate,
      VoidCallback? onTap,
      Function(String value)? onChange,
      Function(String value)? onFieldSubmitted,
      int maxLines = 1,
      int? maxLength,
      bool showLabel = true,
      bool floatLabel = true,
      bool readOnly = false,
      bool centerAlign = false,
      bool isDisable = false}) {
    return TextFormField(
        readOnly: (isDate || isFile || readOnly),
        showCursor: !(isDate || isFile || readOnly),
        onTap: onTap,
        maxLines: maxLines,
        autofillHints: [autofillHints],
        focusNode: focusNode,
        textAlign: centerAlign ? TextAlign.center : TextAlign.start,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChange,
        keyboardType: maxLines == 1 ? keyboardType : TextInputType.multiline,
        inputFormatters: keyboardType == TextInputType.number ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly] : null,
        textCapitalization: textCapitalization,
        obscureText: (isPassword) ? !showPassword : false,
        controller: controller,
        style: TextStyle(color: ThemeColor.jetBlack, fontSize: 12, fontWeight: FontWeight.w400),
        maxLength: maxLength,
        autofocus: autoFocus,
        enabled: !isDisable,
        validator: (value) => required
            ? value == null || value.isEmpty
                ? errorText
                : null
            : null,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide(width: 1, color: ThemeColor.jetBlack.withValues(alpha: .5))),
            enabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide(width: 1, color: ThemeColor.grey.withValues(alpha: .15))),
            disabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none),
            labelText: showLabel ? labelText : null,
            helperText: helperText,
            isDense: true,
            alignLabelWithHint: true,
            filled: true,
            fillColor: isDisable ? Colors.black45 : ThemeColor.backgroundLight,
            floatingLabelBehavior: floatLabel ? FloatingLabelBehavior.auto : FloatingLabelBehavior.always,
            contentPadding: maxLines == 1 ? ThemePadding.px3 : ThemePadding.px3.copyWith(top: ThemePadding.value * 7),
            labelStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: floatLabel ? 1 : .65), fontSize: 12, fontWeight: FontWeight.w500),
            hintText: showLabel ? hintText : labelText,
            hintStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .4), fontSize: 12, fontWeight: FontWeight.normal),
            floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.w500),
            prefixIcon: icon == null ? null : _pIcon(icon),
            suffixIcon: readOnly
                ? _sIcon(Icons.lock_outlined, null)
                : isPassword
                    ? _sIcon(showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, showPasswordPressed)
                    : (isDate)
                        ? _sIcon(Icons.calendar_month_sharp, null)
                        : (isFile)
                            ? _sIcon(Icons.attach_file_rounded, null)
                            : (hasSubmitButton)
                                ? _sIcon(Icons.adaptive.arrow_forward, onFieldSubmittedAlternate)
                                : _sIcon(Icons.cancel_outlined, () => controller.clear())));
  }

  static Column inLine(
      {required String labelText,
      bool isPassword = false,
      bool inLine = true,
      EdgeInsets? padding,
      IconData? icon,
      bool isDate = false,
      bool isFile = false,
      bool hasSubmitButton = false,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      required TextEditingController controller,
      bool autoFocus = false,
      FocusNode? focusNode,
      String errorText = "This field should not be empty",
      bool required = false,
      String? autofillHints,
      String? helperText,
      bool showPassword = false,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      VoidCallback? showPasswordPressed,
      VoidCallback? onFieldSubmittedAlternate,
      VoidCallback? onTap,
      Function(String value)? onChange,
      Function(String value)? onFieldSubmitted,
      int maxLines = 1,
      int? maxLength,
      bool showLabel = true,
      bool readOnly = false,
      bool centerAlign = false,
      bool isDisable = false}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          decoration:
              BoxDecoration(color: isDisable ? Colors.black45 : ThemeColor.backgroundLight, borderRadius: ThemeBorderRadius.r1, border: Border.all(width: 1, color: ThemeColor.jetBlack.withValues(alpha: .3))),
          padding: ThemePadding.pt3,
          child: TextFormField(
              readOnly: (isDate || isFile || readOnly),
              showCursor: !(isDate || isFile || readOnly),
              onTap: onTap,
              maxLines: maxLines,
              autofillHints: autofillHints == null ? null : [autofillHints],
              focusNode: focusNode,
              textAlign: centerAlign ? TextAlign.center : TextAlign.start,
              onFieldSubmitted: onFieldSubmitted,
              onChanged: onChange,
              keyboardType: maxLines == 1 ? keyboardType : TextInputType.multiline,
              inputFormatters: keyboardType == TextInputType.number ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly] : null,
              textCapitalization: textCapitalization,
              obscureText: (isPassword) ? !showPassword : false,
              controller: controller,
              style: TextStyle(color: ThemeColor.jetBlack, fontSize: 12, fontWeight: FontWeight.w400, height: 2),
              maxLength: maxLength,
              autofocus: autoFocus,
              enabled: !isDisable,
              validator: (value) => required
                  ? value == null || value.isEmpty
                      ? errorText
                      : null
                  : null,
              decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: showLabel ? labelText : null,
                  isDense: true,
                  alignLabelWithHint: true,
                  filled: false,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: maxLines == 1 ? ThemePadding.px3 : ThemePadding.px3.copyWith(top: ThemePadding.value * 7),
                  labelStyle: TextStyle(color: ThemeColor.jetBlack, fontSize: 14, fontWeight: FontWeight.w500),
                  hintText: showLabel ? hintText : labelText,
                  hintStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .4), fontSize: 12, fontWeight: FontWeight.normal),
                  floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontSize: 14, fontWeight: FontWeight.w500),
                  prefixIcon: icon == null ? null : _pIcon(icon),
                  suffixIcon: readOnly
                      ? _sIcon(Icons.lock_outlined, null)
                      : isPassword
                          ? _sIcon(showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, showPasswordPressed)
                          : (isDate)
                              ? _sIcon(Icons.calendar_month_sharp, null)
                              : (isFile)
                                  ? _sIcon(Icons.attach_file_rounded, null)
                                  : (hasSubmitButton)
                                      ? _sIcon(Icons.adaptive.arrow_forward, onFieldSubmittedAlternate)
                                      : _sIcon(Icons.cancel_outlined, () => controller.clear())))),
      if (helperText != null) Gap.gy2,
      if (helperText != null) Text(helperText, style: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .7), fontSize: 11, fontWeight: FontWeight.normal))
    ]);
  }

  static TextFormField search(
      {required String labelText,
      EdgeInsets? padding,
      IconData? prefixIcon,
      IconData? suffixIcon,
      TextInputType keyboardType = TextInputType.text,
      String hintText = "Type Here",
      required TextEditingController controller,
      bool autoFocus = false,
      FocusNode? focusNode,
      bool required = false,
      String autofillHints = "",
      String? helperText,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      Function(String value)? onChange,
      bool isDisable = false}) {
    return TextFormField(
        readOnly: isDisable,
        autofillHints: [autofillHints],
        focusNode: focusNode,
        textAlign: TextAlign.start,
        onChanged: onChange,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly] : null,
        textCapitalization: textCapitalization,
        controller: controller,
        style: TextStyle(color: ThemeColor.jetBlack, fontSize: 12, fontWeight: FontWeight.w400),
        autofocus: autoFocus,
        enabled: !isDisable,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide(width: 1, color: ThemeColor.jetBlack.withValues(alpha: .5))),
          enabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide(width: 1, color: ThemeColor.grey.withValues(alpha: .15))),
          disabledBorder: OutlineInputBorder(borderRadius: ThemeBorderRadius.r1, borderSide: BorderSide.none),
          labelText: labelText,
          helperText: helperText,
          isDense: true,
          alignLabelWithHint: true,
          filled: true,
          fillColor: isDisable ? Colors.black45 : ThemeColor.backgroundLight,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: ThemePadding.p3,
          labelStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .65), fontSize: 12, fontWeight: FontWeight.w400),
          hintText: labelText,
          hintStyle: TextStyle(color: ThemeColor.jetBlack.withValues(alpha: .4), fontSize: 12, fontWeight: FontWeight.normal),
          floatingLabelStyle: TextStyle(color: ThemeColor.primary, fontWeight: FontWeight.w500),
        ));
  }
}
