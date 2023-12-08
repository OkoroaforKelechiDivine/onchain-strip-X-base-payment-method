import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/inflow_response.dart';
import 'package:pay_me_mobile/src/views/screens/raise_payment/components/info_row.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/transaction_type_design.dart';

class InflowDetails extends StatelessWidget {
  final InflowResponse transactionResponse;
  const InflowDetails({super.key, required this.transactionResponse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BuildInfoRow(
              label: 'Account Name',
              value: transactionResponse.originatorAccountName),
          const SizedBox(height: 10),
          buildDivider(),
          const SizedBox(height: 10),
          BuildInfoRow(
              label: 'From', value: transactionResponse.originatorBank),
          buildDivider(),
          const SizedBox(height: 15),
          BuildInfoRow(
              label: 'Description',
              value: transactionResponse.statusDescription),
          const SizedBox(height: 15),
          buildDivider(),
          const SizedBox(height: 15),
          BuildInfoRow(
            label: 'Outward Transfer',
            value: "#${formatBalance(transactionResponse.amount.toDouble())}",
          ),
          const SizedBox(height: 15),
          buildDivider(),
          // const SizedBox(height: 15),
          // const BuildInfoRow(
          //     label: 'Payment Method', value: 'Fees'),
          // const SizedBox(height: 15),
          // buildDivider(),
          const SizedBox(height: 15),
          const BuildInfoRow(label: 'Status', value: 'Successful'),
          const SizedBox(height: 15),
          buildDivider(),
          const SizedBox(height: 15),
          BuildInfoRow(
              label: 'Transaction Id',
              value: transactionResponse.transactionId),
          const SizedBox(height: 15),
          buildDivider(),
        ],
      ),
    );
  }
}
