import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/buy_airtime_viewmodel.dart';

import '../buy_airtime_screen.dart';
import 'amount_card.dart';

class BuildAmountCards extends StatelessWidget {
  final BuyAirtimeViewModel model;
  const BuildAmountCards({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BuildAmountCard(
              title: "₦200",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 0,
              selectedIndex: model.selectedAmountIndex,
              onAmountChanged: () {
                model.onSelectAmount("200", 0);
              },
            ),
            BuildAmountCard(
              title: "₦500",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 1,
              selectedIndex: model.selectedAmountIndex,
              onAmountChanged: () {
                model.onSelectAmount("500", 1);
              },
            ),
            BuildAmountCard(
              title: "₦1000",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 2,
              selectedIndex: model.selectedAmountIndex,
              onAmountChanged: () {
                model.onSelectAmount("1000", 2);
              },
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
              selectedIndex: model.selectedAmountIndex,
              onAmountChanged: () {
                model.onSelectAmount("2000", 3);
              },
            ),
            BuildAmountCard(
              title: "₦3000",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 4,
              selectedIndex: model.selectedAmountIndex,
              onAmountChanged: () {
                model.onSelectAmount("3000", 4);
              },
            ),
            BuildAmountCard(
              title: "₦5000",
              style: CustomStyles.buyAirtimeTextStyleInfo,
              cardIndex: 5,
              selectedIndex: model.selectedAmountIndex,
              onAmountChanged: () {
                model.onSelectAmount("5000", 5);
              },
            ),
          ],
        ),
      ],
    );
  }
}
