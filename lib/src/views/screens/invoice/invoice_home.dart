import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/add_customers/add_customer_view.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/create_invoice/create_invoice_view.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/invoice_home_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/tabs/customers_tab.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/tabs/invoice_tab.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class InvoiceHomeScreen extends StatelessWidget {
  const InvoiceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => InvoiceHomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.invoiceBg,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 30 + 56),
                  const InvoiceCustomHeader(),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        model.currentIndex == 0 ? 'Invoices' : "Customers",
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (model.currentIndex == 0) {
                            navigationService.push(CreateInvoiceView(
                              customers: model.cusstomerList,
                            ));
                          } else {
                            navigationService.push(const AddCustomerView());
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.lightGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              AppText(
                                model.currentIndex == 0
                                    ? "Create Invoice"
                                    : "Add Customer",
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 10),
                              SvgPicture.asset(AppAssets.add),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 33),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 22),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFC),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              onTap: model.setIndex,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              tabs: const [
                                Tab(text: 'Invoices'),
                                Tab(text: 'Customers'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                InvoiceTab(
                                  model: model,
                                ),
                                CustomerTab(
                                  model: model,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
