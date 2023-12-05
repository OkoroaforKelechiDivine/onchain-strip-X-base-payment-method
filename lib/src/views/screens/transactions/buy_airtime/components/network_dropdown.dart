import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/buy_airtime_viewmodel.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildNetworkDropDown extends StatefulWidget {
  final BuyAirtimeViewModel model;
  const BuildNetworkDropDown({super.key, required this.model});

  @override
  State<BuildNetworkDropDown> createState() => _BuildNetworkDropDownState();
}

class _BuildNetworkDropDownState extends State<BuildNetworkDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.lightGrey.withOpacity(0.1),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: widget.model.selectedValue,
        //underline: ,
        onChanged: (newValue) {
          widget.model.onSelelectNetwork(newValue!);
        },
        items: widget.model.dropdownItems
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
