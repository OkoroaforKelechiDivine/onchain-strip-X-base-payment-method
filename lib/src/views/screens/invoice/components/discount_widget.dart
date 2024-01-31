import 'package:flutter/material.dart';

import '../../../../../core/cores.dart';

class DiscounttWidget extends StatelessWidget {
  final TextEditingController discount;
  final double price;

  const DiscounttWidget({
    Key? key,
    required this.discount,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppCustomTextField(
          hintText: 'Type',
          backgroundColor: Colors.white,
          borderColor: Colors.transparent,
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: AppCustomTextField(
                onChanged: (value) {},
                hintText: '0',
                initialText: "N",
                backgroundColor: Colors.white,
                borderColor: Colors.transparent,
                textInputType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),

            const SizedBox(width: 8.0),
            Expanded(
              flex: 2,
              child: AppCustomTextField(
                readOnly: true,
                textEditingController:
                    TextEditingController(text: price.toStringAsFixed(2)),
                onChanged: (value) {},
                hintText: '0',
                backgroundColor: Colors.white,
                borderColor: Colors.transparent,
                textInputType:
                    const TextInputType.numberWithOptions(decimal: true),
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
