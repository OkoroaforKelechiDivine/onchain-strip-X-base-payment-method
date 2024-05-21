import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/presentation/invoice/components/invoice_tile.dart';
import 'package:pay_me_mobile/presentation/invoice/invoice_details/invoice_details_view.dart';
import 'package:pay_me_mobile/presentation/invoice/invoice_home_viewmodel.dart';

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
          // if (model.isLoadingInvoice) {
          //   return const Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SizedBox(
          //           height: 50, width: 50, child: CircularProgressIndicator()),
          //     ],
          //   );
          // }
          // if (model.invoiceList.isEmpty) {
          //   return const Center(
          //       child: AppText("No invoice found. Create Invoice"));
          // }
          return ListView.separated(
            controller: model.scrollController,
            //reverse: true,
            itemCount: 20,
            //hrinkWrap: true,
            itemBuilder: (context, index) {
              //final invoice = model.invoiceList[index];
              return InvoiceTile(
                title: "Contop Group",
                subtitle: "INV-1 |Issued : Feb 1",
                amount: "N54,000",
                onEdit: () {},
                onDelete: () {},
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
