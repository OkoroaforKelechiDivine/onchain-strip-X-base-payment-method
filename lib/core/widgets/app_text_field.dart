import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';

import '../constants/font_weights.dart';

class AppCustomTextField extends StatelessWidget {
  final String? title, hintText, initialText, labelText;
  final TextInputType? textInputType;
  final Widget? icon, suffixIcon, prefixIcon;
  final bool? obscureText, enabled, autofocus, showCursor, isDense;
  final String? obscureChar, suffixText, errorText;
  final TextEditingController? textEditingController;
  final Function()? onTap;
  final double? fontSize,
      borderWidth,
      focusBorderWidth,
      borderRadius,
      textHeight;
  final int? maxLines, minLines, maxLength, hintMaxLines;
  final EdgeInsets? margin;
  final Iterable<String>? autofillHints;
  final EdgeInsets? padding, containerPadding;
  final Function(String)? onChanged, onSubmitted;
  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final TextStyle? errorStyle, labelTextStyle;
  final TextAlign? textAlign;
  final BoxConstraints? suffixBoxConstraints, prefixBoxConstraints, constraints;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final FontWeight? fontWeight;
  final bool? disableTyping;

  final OutlineInputBorder? disabledBorder,
      enabledBorder,
      focusedBorder,
      errorBorder;
  final Color? borderColor,
      focusBorderColor,
      backgroundColor,
      errorBorderColor,
      hintTextColor,
      textColor;
  final TextAlignVertical? textAlignVertical;
  final bool? readOnly;
  final TextStyle? suffixStyle;
  final TextCapitalization? textCapitalization;
  final Widget? counter;
  final Widget? Function(BuildContext context,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;

  const AppCustomTextField(
      {Key? key,
      this.title,
      this.hintText,
      this.textInputType,
      this.icon,
      this.disableTyping,
      this.suffixIcon,
      this.obscureText,
      this.obscureChar,
      this.onTap,
      this.fontSize,
      this.maxLines,
      this.minLines,
      this.margin,
      this.padding,
      this.onChanged,
      this.onEditingComplete,
      this.counter,
      this.suffixText,
      this.validator,
      this.initialText,
      this.textEditingController,
      this.enabled,
      this.suffixBoxConstraints,
      this.prefixBoxConstraints,
      this.errorText,
      this.errorStyle,
      this.maxLength,
      this.inputFormatters,
      this.autofocus,
      this.textAlign,
      this.focusNode,
      this.showCursor,
      this.borderWidth,
      this.autofillHints,
      this.prefixIcon,
      this.borderColor,
      this.borderRadius,
      this.backgroundColor,
      this.focusBorderColor,
      this.focusBorderWidth,
      this.textHeight,
      this.errorBorderColor,
      this.textInputAction,
      this.onSubmitted,
      this.disabledBorder,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.labelText,
      this.labelTextStyle,
      this.textAlignVertical,
      this.constraints,
      this.textColor,
      this.fontWeight,
      this.buildCounter,
      this.textCapitalization,
      this.isDense,
      this.hintTextColor,
      this.hintMaxLines,
      this.suffixStyle,
      this.readOnly,
      this.containerPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Padding(
        padding: containerPadding ??
            EdgeInsets.only(top: 20.w, right: 15.w, left: 15.w),
        child: IgnorePointer(
          ignoring: disableTyping ?? false,
          child: TextFormField(
            readOnly: readOnly ?? false,
            autofillHints: autofillHints,
            focusNode: focusNode,
            autofocus: autofocus ?? false,
            maxLength: maxLength,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            validator: validator,
            textAlign: textAlign ?? TextAlign.start,
            style: TextStyle(
                fontSize: fontSize ?? 15.sp,
                height: textHeight,
                color: AppColors.black,
                fontWeight: fontWeight ?? AppFontWeight.medium),
            initialValue: initialText == null ? null : initialText!,
            onEditingComplete: onEditingComplete,
            onChanged: onChanged,
            onTap: onTap,
            cursorColor: AppColors.black,
            showCursor: showCursor ?? true,
            obscureText: obscureText == null ? false : obscureText!,
            obscuringCharacter: obscureChar != null ? obscureChar! : '*',
            keyboardType: textInputType,
            textInputAction: textInputAction,
            onFieldSubmitted: onSubmitted,
            maxLines: maxLines,
            textAlignVertical: textAlignVertical,
            minLines: minLines,
            buildCounter: buildCounter,
            controller: textEditingController,
            enabled: enabled ?? true,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              suffixStyle: suffixStyle ??
                  const TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                  ),
              counter: counter,
              alignLabelWithHint: true,
              labelText: labelText,
              labelStyle: labelTextStyle,
              prefixIcon: prefixIcon,
              errorStyle: errorStyle,
              errorText: errorText,
              isDense: isDense ?? true,
              contentPadding:
                  padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              suffixText: suffixText,
              suffixIconConstraints: suffixBoxConstraints,
              suffixIcon: suffixIcon == null ? null : suffixIcon!,
              icon: icon == null
                  ? null
                  : Container(
                      margin: const EdgeInsets.only(left: 16), child: icon),
              constraints: constraints,
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                    borderSide: BorderSide(
                        color: focusBorderColor ?? AppColors.lightGreen,
                        width: focusBorderWidth ?? 1),
                  ),
              disabledBorder: disabledBorder,
              enabledBorder: enabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                    borderSide: BorderSide(
                        color: borderColor ?? AppColors.lightGreen,
                        width: borderWidth ?? 1),
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.lightGreen,
                    width: borderWidth ?? 1),
              ),
              errorBorder: errorBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 12),
                    borderSide: BorderSide(
                        color: errorBorderColor ?? Colors.red,
                        width: borderWidth ?? 1),
                  ),
              filled: true,
              fillColor: backgroundColor ?? Colors.transparent,
              hintText: hintText,
              hintMaxLines: hintMaxLines,
              hintStyle: GoogleFonts.outfit(
                  textStyle: TextStyle(
                      color: AppColors.grey,
                      fontSize: fontSize,
                      fontWeight: fontWeight)),
            ),
          ),
        ),
      ),
    );
  }
}
