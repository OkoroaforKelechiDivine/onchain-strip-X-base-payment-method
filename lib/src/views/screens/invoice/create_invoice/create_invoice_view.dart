import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_customer_res.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/discount_widget.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_entry_item.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/tax_widget.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/create_invoice/create_invoice_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/cores.dart';

class CreateInvoiceView extends StatelessWidget {
  final List<GetCustomerRes> customers;
  final int invoiceNumber;
  const CreateInvoiceView(
      {super.key, required this.customers, required this.invoiceNumber});

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

                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<GetCustomerRes>(
                        // The current value of the dropdown.
                        value: viewModel.selectedCustomer,
                        // Called when the user selects an item.
                        onChanged: (GetCustomerRes? newValue) {
                          //viewModel.selectedDropdownItem = newValue;
                          viewModel.selectCustomer(newValue);
                        },
                        // The list of items the user can select.
                        items: customers.map<DropdownMenuItem<GetCustomerRes>>(
                            (GetCustomerRes value) {
                          return DropdownMenuItem<GetCustomerRes>(
                            value: value,
                            child: Text(value.name),
                          );
                        }).toList(),
                        // Customization for the dropdown button.
                        isExpanded: true,
                        hint: const Text('Select an item'),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     padding: const EdgeInsets.all(16.0),
                  //     decoration: BoxDecoration(
                  //       color: AppColors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         AppText(viewModel.selectedCustomer),
                  //         const Icon(Icons.arrow_drop_down,
                  //             color: Colors.black),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
                        return InvoiceSingleDetail(
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
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFFFFB703),
                      ),
                      label: const Text(
                        'Add additional item',
                        style: TextStyle(color: Color(0xFFFFB703)),
                      ),
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
                        'N ${formatBalance(double.parse(viewModel.subtotal().toStringAsFixed(2)))}',
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
                    price: viewModel.discountAmount(),
                    onChanged: (p0) {
                      viewModel.updateTotal(p0);
                    },
                    selectedValue: viewModel.selectedDiscountType,
                    onSelected: () {
                      viewModel.selectDiscount();
                    },
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
                    tax: viewModel.tax,
                    price: viewModel.taxAmount(),
                    onChanged: (p0) {
                      viewModel.updateTotal(p0);
                    },
                    selectedValue: viewModel.selectedTaxType,
                    onSelected: () {
                      viewModel.selectTaxType();
                    },
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
                        'N ${formatBalance(double.parse(viewModel.total().toStringAsFixed(2)))}',
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
                    textEditingController: viewModel.additionalNoteTEC,
                    minLines: 8,
                    //backgroundColor: Colors.white,
                    //borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 32),
                  // AppCustomButton(
                  //   title: "Proceed to Preview",
                  //   onPressed: () {
                  //     viewModel.generateInvoicePdf();
                  //   },
                  //   color: AppColors.black,
                  // ),
                  // const SizedBox(height: 18),
                  AppCustomButton(
                    loading: viewModel.isSavingInvoice,
                    elevation: 0,
                    // title: "Save",
                    onPressed: () {
                      viewModel.saveInvoice(invoiceNumber);
                    },
                    borderColor: AppColors.black,
                    color: Colors.black,
                    borderWidth: 1,
                    child: const AppText(
                      "Save to Draft",
                      color: AppColors.white,
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
