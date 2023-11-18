import 'package:flutter/material.dart';

import '../buy_airtime_screen.dart';
import 'amount_card.dart';

class BuildAmountCards extends StatelessWidget {
  const BuildAmountCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildAmountCard(
              title: "₦200",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 0,
            ),
            BuildAmountCard(
              title: "₦500",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 1,
            ),
            BuildAmountCard(
              title: "₦1000",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 2,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildAmountCard(
              title: "₦2000",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 3,
            ),
            BuildAmountCard(
              title: "₦3000",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 4,
            ),
            BuildAmountCard(
              title: "₦5000",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 2,
            ),
          ],
        ),
      ],
    );
  }
}
