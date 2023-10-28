import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utilities/app_fonts.dart';

class AppTextField extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool isPassword;
  final bool isInfo;
  final void Function(String)? onChanged;

  const AppTextField(
      {super.key,
        required this.title,
        this.controller,
        this.hintText,
        this.hintStyle,
        this.isPassword = false,
        this.isInfo = false,
        this.onChanged});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: lato(
                color: const Color(0xFF666666),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            widget.isInfo
                ? Row(
              children: [
                SizedBox(
                  width: 2.w,
                ),
                Icon(
                  Icons.info_outline,
                  size: 14.sp,
                  color: const Color(0xFF999999),
                ),
              ],
            )
                : Container()
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        Container(
          height: 50.h,
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          decoration: ShapeDecoration(
            color: const Color(0xFFF5F7FA),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: widget.isPassword ? isVisible : false,
                  obscuringCharacter: '•',
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.isPassword
                          ? isVisible
                          ? '••••••••••'
                          : 'Enter password'
                          : widget.hintText,
                      hintStyle: widget.hintStyle ??
                          nunito(
                            color: const Color(0xFF999999),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          )),
                ),
              ),
              widget.isPassword
                  ? Row(
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(
                        isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                        size: 16.sp,
                      )),
                ],
              )
                  : Container()
            ],
          ),
        )
      ],
    );
  }
}
