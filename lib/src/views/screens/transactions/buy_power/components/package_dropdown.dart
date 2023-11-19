import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildPackageDropdown extends StatefulWidget {
  const BuildPackageDropdown({super.key});

  @override
  State<BuildPackageDropdown> createState() => _BuildPackageDropdownState();
}

class _BuildPackageDropdownState extends State<BuildPackageDropdown> {

  String? selectedPackage;

  List<DropdownMenuItem<String>> packageItems = [
    const DropdownMenuItem<String>(
      value: "Package 1",
      child: Text("Package 1"),
    ),
    const DropdownMenuItem<String>(
      value: "Package 2",
      child: Text("Package 2"),
    ),
    const DropdownMenuItem<String>(
      value: "Package 3",
      child: Text("Package 3"),
    ),
    const DropdownMenuItem<String>(
      value: "Package 4",
      child: Text("Package 4"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Choose Package",
            hintStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: AppFontSize.size14,
              fontWeight: AppFontWeight.light,
            ),
            filled: true,
            fillColor: AppColors.pureWhite,
            focusColor: AppColors.pureWhite,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          value: selectedPackage,
          onChanged: (newValue) {
            setState(() {
              selectedPackage = newValue;
            });
          },
          items: packageItems,
        ),
      ),
    );
  }
}
