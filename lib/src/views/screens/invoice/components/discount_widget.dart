import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/number_formater.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';

import '../../../../../core/cores.dart';

class DiscounttWidget extends StatelessWidget {
  final TextEditingController discount;
  final double price;
  final String selectedValue;
  final Function(String?) onSelected;
  final Function(String) onChanged;

  const DiscounttWidget({
    Key? key,
    required this.discount,
    required this.price,
    required this.selectedValue,
    required this.onSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const AppText("Select Discount Type"),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: AppColors.white),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              // The current value of the dropdown.
              value: selectedValue,
              // Called when the user selects an item.
              onChanged: (String? newValue) {
                //viewModel.selectedDropdownItem = newValue;
                onSelected(newValue);
              },
              // The list of items the user can select.
              items: [
                "Fixed",
                "Percentage",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              // Customization for the dropdown button.
              isExpanded: true,
              hint: const Text('Select an item'),
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        // GestureDetector(
        //   onTap: () {
        //     onSelected();
        //   },
        //   child: Container(
        //     padding: const EdgeInsets.all(16.0),
        //     decoration: BoxDecoration(
        //       color: AppColors.white,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         AppText(selectedValue),
        //         const Icon(Icons.arrow_drop_down, color: Colors.black),
        //       ],
        //     ),
        //   ),
        // ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(selectedValue == "Fixed" ? "Rate" : "Percent"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    textEditingController: discount,
                    inputFormatters: [NumericTextFormatter()],
                    onChanged: (value) {
                      onChanged(value);
                    },
                    hintText: '0',
                    suffixText: selectedValue == "Fixed" ? "₦" : "%",
                    //initialText: selectedValue == "Fixed" ? "N" : "%",
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText("Amount(-)"),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    readOnly: true,
                    textEditingController: TextEditingController(
                        text: formatBalance(
                            double.parse(price.toStringAsFixed(2)))),
                    onChanged: (value) {},
                    hintText: '0',
                    backgroundColor: Colors.white,
                    suffixText: "₦",
                    borderColor: Colors.transparent,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Text(
            //       entry.amount.toStringAsFixed(2)), // Display calculated amount
            // ),
          ],
        ),
      ],
    );
  }
}
