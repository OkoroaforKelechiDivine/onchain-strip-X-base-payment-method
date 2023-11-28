import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../custom/custom_amount_input_field.dart';

class BuildAmountCard extends StatefulWidget {
  final String title;
  final int selectedIndex;
  final TextStyle style;
  final int cardIndex;
  final Function() onAmountChanged;

  const BuildAmountCard({
    super.key,
    required this.title,
    required this.selectedIndex,
    required this.style,
    required this.cardIndex,
    required this.onAmountChanged,
  });

  @override
  State<BuildAmountCard> createState() => _BuildAmountCardState();
}

class _BuildAmountCardState extends State<BuildAmountCard> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.selectedIndex == widget.cardIndex;

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          widget.onAmountChanged();
          // setState(() {
          //   String formattedAmount = AmountFormatter.formatAmount(widget.title);
          //   amountController.text = formattedAmount;
          //   selectedAmountIndex = widget.cardIndex;
          // });
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          color: AppColors
              .lightBlue, //isSelected ? AppColors.lightGreen : AppColors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 70,
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15.0),
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.style.color,
                      //isSelected ? AppColors.pureWhite :
                      fontSize: widget.style.fontSize,
                      fontWeight: widget.style?.fontWeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
