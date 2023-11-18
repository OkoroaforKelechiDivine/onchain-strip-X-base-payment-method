import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../custom/custom_amount_input_field.dart';

class BuildAmountCard extends StatefulWidget {
  final String title;
  final int cardIndex;
  final TextStyle style;

  const BuildAmountCard({
    super.key,
    required this.title,
    required this.cardIndex,
    required this.style,
  });

  @override
  State<BuildAmountCard> createState() => _BuildAmountCardState();
  
}

class _BuildAmountCardState extends State<BuildAmountCard> {
  int? selectedAmountIndex;
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedAmountIndex == widget.cardIndex;

    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            String formattedAmount = AmountFormatter.formatAmount(widget.title);
            amountController.text = formattedAmount;
            selectedAmountIndex = widget.cardIndex;
          });
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          color: isSelected ? AppColors.lightGreen : AppColors.lightBlue,
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
                      color: isSelected ? AppColors.pureWhite : widget.style.color,
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