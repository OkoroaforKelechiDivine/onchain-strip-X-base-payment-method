import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
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
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()),
              ],
            );
          }
          if (model.invoiceList.isEmpty) {
            return const Center(
                child: AppText("No invoice found. Create Invoice"));
          }
          return ListView.separated(
            //reverse: true,
            itemCount: model.invoiceList.length,
            //hrinkWrap: true,
            itemBuilder: (context, index) {
              final invoice = model.invoiceList[index];
              return FocusedMenuHolder(
                menuWidth: MediaQuery.of(context).size.width * 0.50,
                blurSize: 5.0,
                menuItemExtent: 45,
                menuBoxDecoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                duration: const Duration(milliseconds: 100),
                animateMenuItems: true,
                blurBackgroundColor: Colors.black54,
                openWithTap:
                    false, // Open Focused-Menu on Tap rather than Long Press
                menuOffset:
                    10.0, // Offset value to show menuItem from the selected item
                bottomOffsetHeight: 80.0,
                menuItems: <FocusedMenuItem>[
                  FocusedMenuItem(
                    title: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    trailingIcon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      model.deleteInvoice(invoice.id.toString());
                    },
                  ),
                ],
                onPressed: () {},
                child: GestureDetector(
                  onTap: () {
                    navigationService.push(InvoiceDetailsView(id: invoice.id));
                  },
                  child: InvoiceTile(
                    title: invoice.title,
                    subtitle: "Due ${formartDate(invoice.dueDate.toString())}",
                    amount: "${invoice.totalAmount}",
                    status: invoice.paid ? "Paid" : "Pending",
                  ),
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
