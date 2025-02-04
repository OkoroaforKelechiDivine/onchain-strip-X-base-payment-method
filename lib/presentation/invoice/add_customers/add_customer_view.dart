import 'package:flutter/material.dart';
import 'package:pay_me_mobile/presentation/invoice/add_customers/add_customer_view_model.dart';
import 'package:pay_me_mobile/presentation/invoice/components/invoice_custom_header.dart';
import 'package:stacked/stacked.dart';

import '../../../core/cores.dart';

class AddCustomerView extends StatelessWidget {
  final Function()? onPop;
  const AddCustomerView({super.key, required this.onPop});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AddCustomerViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.invoiceBg,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30 + 56),
                  const InvoiceCustomHeader(),
                  const SizedBox(height: 18),
                  const AppText(
                    "Add New Customer",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 38),
                  const AppText(
                    "Customer’s Name",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Customer Name",
                    textEditingController: viewModel.customerNameTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Customer’s Email Address",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Customer Email Address",
                    textEditingController: viewModel.customerEmailAddressTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Customer’s Phone Number",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Customer Phone Numver",
                    textEditingController: viewModel.customerPhoneNumberTEC,
                    backgroundColor: Colors.white,
                    textInputType: TextInputType.number,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Customer’s Address",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Customer Address",
                    textEditingController: viewModel.customerAddressTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Customer’s State",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Customer State",
                    textEditingController: viewModel.customerStateTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 38),
                  AppButton(
                    loading: viewModel.isLoading,
                    title: "Save",
                    onPressed: () {
                      viewModel.addCustomer(onPop);
                    },
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 18),
                  AppButton(
                    elevation: 0,
                    // title: "Save",
                    onPressed: () {
                      navigationService.pop();
                    },
                    borderColor: AppColors.black,
                    color: Colors.transparent,
                    borderWidth: 1,
                    child: const AppText(
                      "Cancel",
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 38),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
