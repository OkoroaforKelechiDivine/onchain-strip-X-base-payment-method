import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/customer_tile.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/invoice_home_viewmodel.dart';

import '../../../../../core/cores.dart';

class CustomerTab extends StatelessWidget {
  final InvoiceHomeViewModel model;
  const CustomerTab({super.key, required this.model});

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
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
          if (model.cusstomerList.isEmpty) {
            return const Center(
                child: AppText("No Customer found. Create Customer"));
          }
          return ListView.separated(
            itemCount: model.cusstomerList.length,
            //hrinkWrap: true,
            itemBuilder: (context, index) {
              final customer = model.cusstomerList[index];
              return GestureDetector(
                onTap: () {
                  //navigationService.push(const InvoiceDetailsView());
                },
                child: CustomerTile(
                  title: customer.name,
                  subtitle: customer.email,
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
