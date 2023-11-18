import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/transfer_card.dart';

class BuildCardWidget extends StatelessWidget {
  const BuildCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 5),
      child: SizedBox(
        height: 80.0,
        child: Row(
          children: [
            BuildTransferCard(text: "Transfer", routeName: "/transfer"),
            BuildTransferCard(text: "Airtime", routeName: "/buy_airtime"),
            BuildTransferCard(text: "Buy Power", routeName: "/buy_power"),
          ],
        ),
      ),
    );
  }
}
