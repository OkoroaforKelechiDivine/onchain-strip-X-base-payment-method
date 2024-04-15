import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/invoice_details/invoice_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class InvoiceDetailsView extends StatelessWidget {
  final int id;
  const InvoiceDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => InvoiceDetailsViewModel(),
      onModelReady: (model) => model.getSingleInvoice(id),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.invoiceBg,
          body: Builder(
            builder: (context) {
              if (model.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (model.invoice == null) {
                return const Center(child: AppText("No invoice found"));
              }
              if (model.invoice != null) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30 + 56),
                        const InvoiceCustomHeader(),
                        const SizedBox(height: 18),
                        AppText(
                          model.invoice?.title ?? "",
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        const SizedBox(height: 6),
                        AppText(
                          "Address: ${model.invoice?.customerAddress}",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.invoiceGreyText,
                        ),
                        const SizedBox(height: 19),
                        AppRectangle(
                          color: AppColors.white,
                          radius: 10,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Amount Due",
                                fontSize: 16,
                                color: AppColors.invoiceGreyText,
                              ),
                              const SizedBox(height: 10),
                              AppText(
                                "N ${formatBalance(model.invoice!.totalAmount)}",
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        AppRectangle(
                          color: AppColors.white,
                          radius: 10,
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              "Issued on",
                                              fontSize: 16,
                                              color: AppColors.invoiceGreyText,
                                            ),
                                            const SizedBox(height: 10),
                                            AppText(
                                              formartDate(model
                                                  .invoice!.createdAt
                                                  .toString()),
                                              fontSize: 18,
                                              color: AppColors.black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  //Spacer(),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              "Due on",
                                              fontSize: 16,
                                              color: AppColors.invoiceGreyText,
                                            ),
                                            const SizedBox(height: 10),
                                            AppText(
                                              formartDate(model.invoice!.dueDate
                                                  .toString()),
                                              fontSize: 18,
                                              color: AppColors.black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              AppText(
                                "Invoice for",
                                fontSize: 16,
                                color: AppColors.invoiceGreyText,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.invoiceIconBg,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: SvgPicture.asset(
                                      AppAssets.receipt,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        model.invoice?.customerName ?? "",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black,
                                      ),
                                      AppText(
                                        model.invoice?.customerPhone ?? "",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.invoiceGreyText,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 29),
                        const AppText(
                          "Items",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        const SizedBox(height: 29),
                        AppRectangle(
                          color: AppColors.white,
                          radius: 10,
                          width: double.infinity,
                          padding: const EdgeInsets.all(13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final item = model.invoice?.items[index];
                                      return Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppText(
                                                item?.description ?? "",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.black,
                                              ),
                                              const SizedBox(height: 5),
                                              AppText(
                                                "Quantity: ${item?.quantity} * N${item?.pricePerUnit}",
                                                fontSize: 16,
                                                color:
                                                    AppColors.invoiceGreyText,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          AppText(
                                            "N ${formatBalance(item!.amount)}",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black,
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Divider();
                                    },
                                    itemCount:
                                        model.invoice?.items.length ?? 0),
                              ),
                              const Divider(),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AppText(
                                    'Subtotal: ',
                                    fontSize: 16,
                                  ),
                                  AppText(
                                    'N ${formatBalance((model.invoice!.totalAmount + (model.invoice?.discount ?? 0.0) + (model.invoice?.tax ?? 0.0)))}',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              if (model.invoice?.discount != null ||
                                  model.invoice?.tax != null)
                                const Divider(),
                              if (model.invoice?.discount != null ||
                                  model.invoice?.tax != null)
                                const SizedBox(height: 12),
                              Visibility(
                                visible: model.invoice?.discount != null,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          "Discount",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    AppText(
                                      "- N ${formatBalance(double.parse(model.invoice!.discount.toString()))}",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.invoiceGreyText,
                                    ),
                                  ],
                                ),
                              ),
                              if (model.invoice?.discount != null ||
                                  model.invoice?.tax != null)
                                const SizedBox(height: 26),
                              Visibility(
                                visible: model.invoice?.tax != null,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          "Tax",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    AppText(
                                      "+N ${formatBalance(double.parse(model.invoice!.tax.toString()))}",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.invoiceGreyText,
                                    ),
                                  ],
                                ),
                              ),
                              if (model.invoice?.discount != null ||
                                  model.invoice?.tax != null)
                                const SizedBox(height: 12),
                              const Divider(),
                              const SizedBox(height: 26),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AppText(
                                    'Total Amount Due: ',
                                    fontSize: 16,
                                  ),
                                  AppText(
                                    'N ${formatBalance(model.invoice!.totalAmount)}',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                        const SizedBox(height: 29),
                        const AppText(
                          "Notes",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        const SizedBox(height: 29),
                        AppRectangle(
                          color: AppColors.white,
                          radius: 10,
                          width: double.infinity,
                          padding: const EdgeInsets.all(23),
                          child: AppText(
                            model.invoice?.additionalNote ?? "",
                            fontSize: 16,
                            color: AppColors.invoiceGreyText,
                          ),
                        ),
                        const SizedBox(height: 19),
                        AppRectangle(
                          color: const Color(0xFFE6F9F9),
                          radius: 10,
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppText(
                                "Payment should be made to:",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AppText(
                                    "Account Name:",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  AppText(
                                    appGlobals.user!.accountName!,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AppText(
                                    "Account Number:",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  AppText(
                                    appGlobals.user!.accountNumber!,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(
                                    "Bank Name:",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                  AppText(
                                    "VFD MFB",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 45),
                        AppCustomButton(
                          title: "Proceed to Preview",
                          onPressed: () {
                            model.previewPDF();
                          },
                          color: AppColors.lightGreen,
                        ),
                        const SizedBox(height: 18),
                        AppCustomButton(
                          elevation: 0,
                          // title: "Save",
                          onPressed: () {
                            model.openSheet();
                          },
                          borderColor: AppColors.black,
                          color: Colors.transparent,
                          borderWidth: 1,
                          child: const AppText(
                            "Send",
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 45),
                      ],
                    ),
                  ),
                );
              }
              return const AppText("Something Went Wrong");
            },
          ),
        );
      },
    );
  }
}
