import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';

class TextFieldWithDynamicLabel extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isVisible;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onValidation;
  final Color fillColor;
  final String? errorText;

  const TextFieldWithDynamicLabel({
    Key? key,
    required this.controller,
    this.errorText,
    this.fillColor = AppColors.deepWhite,
    required this.hintText,
    required this.labelText,
    this.isVisible = true,
    this.onChanged,
    this.onValidation,
  }) : super(key: key);

  @override
  _TextFieldWithDynamicLabelState createState() => _TextFieldWithDynamicLabelState();
}

class _TextFieldWithDynamicLabelState extends State<TextFieldWithDynamicLabel> {
  bool isLabelVisible = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: widget.controller.text.isNotEmpty ? null : '₦ 0.00',
            hintText: widget.hintText,
            fillColor: widget.fillColor,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkWhite),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkWhite),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            filled: true,
            counterText: '',
            labelStyle: const TextStyle(
              fontSize: AppFontSize.size24,
            ),
            errorText: widget.errorText,
          ),
          textAlign: TextAlign.left,
          onChanged: (text) {
            if (widget.onValidation != null) {
              widget.onValidation!(text);
            }
            setState(() {
              isLabelVisible = text.isEmpty;
            });
          },
          onTap: () {
            setState(() {
              isLabelVisible = false;
            });
          },
          onEditingComplete: () {
            setState(() {
              isLabelVisible = true;
            });
          },
          maxLength: 10,
        ),
      ),
    );
  }
}
