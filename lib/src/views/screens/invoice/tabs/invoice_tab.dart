import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_tile.dart';

class InvoiceTab extends StatelessWidget {
  const InvoiceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        itemCount: 20,
        //hrinkWrap: true,
        itemBuilder: (context, index) {
          return const InvoiceTile(
            title: "John Doe",
            subtitle: "INV-1 | Due Feb 1",
            amount: "N54,000",
            status: "Paid",
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
