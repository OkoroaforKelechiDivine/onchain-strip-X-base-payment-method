import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';

import '../constants/colors.dart';
import 'app_text.dart';

class AppDropDown extends StatelessWidget {
  final List<String>? list;
  final String? hint;
  final int? selected;
  final Function(int?)? onChangeValue;
  final EdgeInsets? margin, padding;
  final Color? background,
      borderColor,
      iconEnabledColor,
      iconDisabledColor,
      dropDownTextColor,
      textColor;
  final FontWeight? dropDownTextWeight, textWeight;
  final double? borderRadius,
      borderWidth,
      height,
      width,
      dropDownTextSize,
      textSize;
  const AppDropDown(
      {Key? key,
      this.list,
      this.selected,
      this.onChangeValue,
      this.hint,
      this.margin,
      this.background,
      this.borderColor,
      this.padding,
      this.borderRadius,
      this.borderWidth,
      this.height,
      this.width,
      this.iconEnabledColor,
      this.iconDisabledColor,
      this.textColor,
      this.textSize,
      this.dropDownTextColor,
      this.dropDownTextWeight,
      this.textWeight,
      this.dropDownTextSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.w, right: 15.w, left: 15.w),
      child: Container(
        margin: margin,
        padding: padding,
        height: height ?? 36,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: borderWidth ?? 1,
                )
              : null,
          color: background ?? AppColors.grey,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 0)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            padding: EdgeInsets.only(left: 8.w, right: 10.w),
            isExpanded: true,
            isDense: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: AppText(
              hint ?? 'Select Option',
              fontSize: 14,
              fontWeight: textWeight ?? AppFontWeight.medium,
              overflow: TextOverflow.ellipsis,
              color: textColor ?? AppColors.grey,
            ),
            value: selected,
            onChanged: onChangeValue,
            iconEnabledColor: iconEnabledColor,
            iconDisabledColor: iconDisabledColor,
            items: buildDropDownMenuItems(list!),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<int>> buildDropDownMenuItems(List<String> list) {
    final items = <DropdownMenuItem<int>>[];
    for (var i = 0; i < list.length; i++) {
      final item = list[i];
      items.add(
        DropdownMenuItem(
          value: i,
          enabled: true,
          // enabled: i == 0 ? false : true,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: AppText(item,
                maxLines: 1,
                fontSize: dropDownTextSize ?? textSize,
                fontWeight: dropDownTextWeight,
                overflow: TextOverflow.ellipsis,
                color: dropDownTextColor ?? Colors.black
                // color: i == 0 ? Colors.grey : Colors.black
                ),
          ),
        ),
      );
    }
    return items;
  }
}
