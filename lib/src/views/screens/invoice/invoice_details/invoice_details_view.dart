import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';

class InvoiceDetailsView extends StatelessWidget {
  const InvoiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Emmytex Ventures",
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              const SizedBox(height: 6),
              const AppText(
                "INV-1",
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
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
                    const AppText(
                      "N 54,000",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    "Issued on",
                                    fontSize: 16,
                                    color: AppColors.invoiceGreyText,
                                  ),
                                  const SizedBox(height: 10),
                                  const AppText(
                                    "Jan 20, 2024",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    "Due on",
                                    fontSize: 16,
                                    color: AppColors.invoiceGreyText,
                                  ),
                                  const SizedBox(height: 10),
                                  const AppText(
                                    "Feb 1, 2024",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              "Emmytex Ventures",
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                            AppText(
                              "emmyventures@gmail.com",
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              "Glover Item",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            const SizedBox(height: 5),
                            AppText(
                              "Quantity: 5 * N500.00",
                              fontSize: 16,
                              color: AppColors.invoiceGreyText,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const AppText(
                          "N 2,500.00",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 12),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Subtotal: ',
                          fontSize: 16,
                        ),
                        AppText(
                          'N 2,500.00',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              "Discount",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            const SizedBox(height: 5),
                            AppText(
                              "8.0 % off",
                              fontSize: 14,
                              color: AppColors.invoiceGreyText,
                            ),
                          ],
                        ),
                        const Spacer(),
                        AppText(
                          "- N 2,500.00",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.invoiceGreyText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppText(
                              "Tax",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                            const SizedBox(height: 5),
                            AppText(
                              "Additional 7.50%",
                              fontSize: 14,
                              color: AppColors.invoiceGreyText,
                            ),
                          ],
                        ),
                        const Spacer(),
                        AppText(
                          "+N 2,500.00",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.invoiceGreyText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(),
                    const SizedBox(height: 26),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Total Amount Due: ',
                          fontSize: 16,
                        ),
                        AppText(
                          'N 2,500.00',
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
                  "Please pay up before due date",
                  fontSize: 16,
                  color: AppColors.invoiceGreyText,
                ),
              ),
              const SizedBox(height: 19),
              const AppRectangle(
                color: Color(0xFFE6F9F9),
                radius: 10,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "Payment should be made to:",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          "Account Name:",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFADBBBB),
                        ),
                        AppText(
                          "Obinna Kenneths",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFADBBBB),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          "Account Number:",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFADBBBB),
                        ),
                        AppText(
                          "1234567812",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFADBBBB),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          "Bank Name:",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFADBBBB),
                        ),
                        AppText(
                          "VFD Bank",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFADBBBB),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 45),
              AppCustomButton(
                title: "Proceed to Preview",
                onPressed: () {},
                color: AppColors.lightGreen,
              ),
              const SizedBox(height: 18),
              AppCustomButton(
                elevation: 0,
                // title: "Save",
                onPressed: () {},
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
      ),
    );
  }
}
