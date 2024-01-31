import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/discount_widget.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_entry_item.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/tax_widget.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/create_invoice/create_invoice_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/cores.dart';

class CreateInvoiceView extends StatelessWidget {
  const CreateInvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreateInvoiceViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
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
                    "Create New Invoice",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 37),
                  AppText(
                    "CUSTOMER’S  INFORMATION",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightGrey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 32),
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
                    "Customer’s Email Addres",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Customer Email Address",
                    textEditingController: viewModel.customerEmailAddressTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 37),
                  AppText(
                    "INVOICE DETAILS",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightGrey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 32),
                  const AppText(
                    "Invoice Title",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Invoice Title",
                    textEditingController: viewModel.invoiceTitleTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Due Date",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      viewModel.selectDate(context);
                    },
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              "${viewModel.selectedDate.toLocal()}"
                                  .split(' ')[0],
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                            const Icon(
                              Icons.calendar_today,
                              color: AppColors.lightGreen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 37),
                  AppText(
                    "ITEMS",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightGrey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 22),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InvoiceItem(
                          entry: viewModel.items[index],
                          index: index + 1,
                          onItemUpdated: viewModel.onItemUpdated,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      itemCount: viewModel.items.length,
                    ),
                  ),
                  Center(
                    child: TextButton.icon(
                      onPressed: viewModel.addItem,
                      icon: const Icon(Icons.add),
                      label: const Text('Add additional item'),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        'Subtotal: ',
                        fontSize: 16,
                      ),
                      AppText(
                        'N ${viewModel.subtotal.toStringAsFixed(2)}',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 37),
                  AppText(
                    "DISCOUNT",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightGrey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 22),
                  DiscounttWidget(
                    discount: viewModel.discount,
                    price: 11.55,
                  ),
                  const SizedBox(height: 22),
                  AppText(
                    "TAX",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.lightGrey.withOpacity(0.5),
                  ),
                  const SizedBox(height: 22),
                  TaxWidget(
                    tax: viewModel.discount,
                    price: 11.55,
                  ),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        'Total: ',
                        fontSize: 16,
                      ),
                      AppText(
                        'N ${viewModel.subtotal.toStringAsFixed(2)}',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 32),
                  const AppText(
                    "Additional Note",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter some additional notes here ...",
                    textEditingController: viewModel.customerEmailAddressTEC,
                    minLines: 8,
                    //backgroundColor: Colors.white,
                    //borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 32),
                  AppCustomButton(
                    title: "Proceed to Preview",
                    onPressed: () {},
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 18),
                  AppCustomButton(
                    elevation: 0,
                    // title: "Save",
                    onPressed: () {
                      navigationService.pop();
                    },
                    borderColor: AppColors.black,
                    color: Colors.transparent,
                    borderWidth: 1,
                    child: const AppText(
                      "Save as Draft",
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
