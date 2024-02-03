import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_tile.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/invoice_details/invoice_details_view.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/invoice_home_viewmodel.dart';

class InvoiceTab extends StatelessWidget {
  final InvoiceHomeViewModel model;
  const InvoiceTab({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Builder(
        builder: (context) {
          if (model.isLoadingInvoice) {
            return const SizedBox(
                height: 200, width: 200, child: CircularProgressIndicator());
          }
          if (model.invoiceList.isEmpty) {
            return const Center(
                child: AppText("No invoice found. Create Invoice"));
          }
          return ListView.separated(
            itemCount: model.invoiceList.length,
            //hrinkWrap: true,
            itemBuilder: (context, index) {
              final invoice = model.invoiceList[index];
              return GestureDetector(
                onTap: () {
                  navigationService.push(const InvoiceDetailsView());
                },
                child: InvoiceTile(
                  title: invoice.title,
                  subtitle: "Due ${invoice.dueDate}",
                  amount: "${invoice.totalAmount}",
                  status: invoice.paid ? "Paid" : "Pending",
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          );
        },
      ),
    );
  }
}
