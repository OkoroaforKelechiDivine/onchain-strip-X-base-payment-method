import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_response.dart';
import 'package:pay_me_mobile/src/views/screens/raise_payment/components/info_row.dart';

class AirtimeRecept extends StatelessWidget {
  final TransactionResponse transactionResponse;
  const AirtimeRecept({super.key, required this.transactionResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //BuildInfoRow(label: 'Phone Number', value: "08141208203"),
        //  const SizedBox(height: 10),
        //buildDivider(),
        // const SizedBox(height: 10),
        // BuildInfoRow(label: 'To', value: transactionResponse.originatorBank!),
        // buildDivider(),
        // const SizedBox(height: 10),
        BuildInfoRow(
            label: 'Transaction Type',
            value: transactionResponse.transactionType!),
        const SizedBox(height: 10),
        buildDivider(),
        // const SizedBox(height: 15),
        // const BuildInfoRow(label: 'Description', value: 'Garri'),
        // const SizedBox(height: 15),
        // buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
          label: 'Outward Transfer',
          value: "₦${formatBalance(transactionResponse.amount!.toDouble())}",
        ),
        const SizedBox(height: 15),
        buildDivider(),
        // const SizedBox(height: 15),
        // const BuildInfoRow(
        //     label: 'Payment Method', value: 'Fees'),
        // const SizedBox(height: 15),
        // buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Status', value: transactionResponse.statusDescription!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Transaction Id',
            value: transactionResponse.transactionId ?? ""),
        const SizedBox(height: 15),
        buildDivider(),
      ],
    );
  }
}

class PowerRecept extends StatelessWidget {
  final TransactionResponse transactionResponse;
  const PowerRecept({super.key, required this.transactionResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //BuildInfoRow(label: 'Meter Number', value: "08141208203"),
        //const SizedBox(height: 10),
        //buildDivider(),
        //const SizedBox(height: 10),
        // BuildInfoRow(label: 'To', value: transactionResponse.originatorBank!),
        // buildDivider(),
        // const SizedBox(height: 10),
        BuildInfoRow(
            label: 'Transaction Type',
            value: transactionResponse.transactionType!),
        const SizedBox(height: 10),
        buildDivider(),
        // const SizedBox(height: 15),
        // const BuildInfoRow(label: 'Description', value: 'Garri'),
        // const SizedBox(height: 15),
        // buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
          label: 'Outward Transfer',
          value: "₦${formatBalance(transactionResponse.amount!.toDouble())}",
        ),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: "Token", value: transactionResponse.purchaseCode ?? ""),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Status', value: transactionResponse.statusDescription!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Transaction Id',
            value: transactionResponse.transactionId ?? ""),
        const SizedBox(height: 15),
        buildDivider(),
      ],
    );
  }
}

class TvCableRecept extends StatelessWidget {
  final TransactionResponse transactionResponse;
  const TvCableRecept({super.key, required this.transactionResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //BuildInfoRow(label: 'Meter Number', value: "08141208203"),
        //const SizedBox(height: 10),
        //buildDivider(),
        //const SizedBox(height: 10),
        // BuildInfoRow(label: 'To', value: transactionResponse.originatorBank!),
        // buildDivider(),
        // const SizedBox(height: 10),
        BuildInfoRow(
            label: 'Transaction Type',
            value: transactionResponse.transactionType!),
        const SizedBox(height: 10),
        buildDivider(),
        // const SizedBox(height: 15),
        // const BuildInfoRow(label: 'Description', value: 'Garri'),
        // const SizedBox(height: 15),
        // buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
          label: 'Outward Transfer',
          value: "₦${formatBalance(transactionResponse.amount!.toDouble())}",
        ),
        const SizedBox(height: 15),
        buildDivider(),
        // const SizedBox(height: 15),
        // const BuildInfoRow(
        //     label: 'Payment Method', value: 'Fees'),
        // const SizedBox(height: 15),
        // buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Status', value: transactionResponse.statusDescription!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Transaction Id',
            value: transactionResponse.transactionId ?? ""),
        const SizedBox(height: 15),
        buildDivider(),
      ],
    );
  }
}

class InflowRecept extends StatelessWidget {
  final TransactionResponse transactionResponse;
  const InflowRecept({super.key, required this.transactionResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildInfoRow(
            label: 'Account Name',
            value: transactionResponse.originatorAccountName!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 10),
        BuildInfoRow(label: 'From', value: transactionResponse.originatorBank!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Sender Account number',
            value: transactionResponse.originatorAccountNumber!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 10),
        BuildInfoRow(
            label: 'Transaction Type',
            value: transactionResponse.transactionType!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Narration',
            value: transactionResponse.transactionNarration!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
          label: 'Inflow Transfer',
          value: "₦${formatBalance(transactionResponse.amount!.toDouble())}",
        ),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Status', value: transactionResponse.statusDescription!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Transaction Id',
            value: transactionResponse.transactionId ?? ""),
        const SizedBox(height: 15),
        buildDivider(),
      ],
    );
  }
}

class CardTransactionRecept extends StatelessWidget {
  final TransactionResponse transactionResponse;
  const CardTransactionRecept({super.key, required this.transactionResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildInfoRow(label: 'Pan', value: transactionResponse.pan!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 10),
        BuildInfoRow(label: 'Rrn', value: transactionResponse.rrn!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(label: 'Stan', value: transactionResponse.stan!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 10),
        BuildInfoRow(
            label: 'Transaction Type',
            value: transactionResponse.transactionType!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Status Code', value: transactionResponse.statusCode!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
          label: 'Amount',
          value: "₦${formatBalance(transactionResponse.amount!.toDouble())}",
        ),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Status', value: transactionResponse.statusDescription!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Transaction Id',
            value: transactionResponse.transactionId ?? ""),
        const SizedBox(height: 15),
        buildDivider(),
      ],
    );
  }
}

class OutflowReceipt extends StatelessWidget {
  final TransactionResponse transactionResponse;
  const OutflowReceipt({super.key, required this.transactionResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildInfoRow(
            label: 'Account Name',
            value: transactionResponse.beneficiaryAccountName!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'To', value: transactionResponse.beneficiaryAccountNumber!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Beneficiary Bank',
            value: transactionResponse.beneficiaryBank!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 10),
        BuildInfoRow(
            label: 'Transaction Type',
            value: transactionResponse.transactionType!),
        const SizedBox(height: 10),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Description',
            value: transactionResponse.transactionNarration!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
          label: 'Outward Transfer',
          value: "₦${formatBalance(transactionResponse.amount!.toDouble())}",
        ),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Status', value: transactionResponse.statusDescription!),
        const SizedBox(height: 15),
        buildDivider(),
        const SizedBox(height: 15),
        BuildInfoRow(
            label: 'Transaction Id',
            value: transactionResponse.transactionId ?? ""),
        const SizedBox(height: 15),
        buildDivider(),
      ],
    );
  }
}

Widget buildDivider() {
  return Container(
    color: AppColors.lightGreen,
    height: 0.5,
  );
}
