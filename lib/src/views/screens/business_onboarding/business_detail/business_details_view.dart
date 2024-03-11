import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/general_util.dart';
import 'package:pay_me_mobile/data/model/response/business/get_all_business.dart';
import 'package:pay_me_mobile/src/views/screens/business_onboarding/business_detail/business_detail_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/business_onboarding/components/business_info_row.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';
import 'package:stacked/stacked.dart';

class BusinessDetailsView extends StatelessWidget {
  final GetBusinessLisRes business;
  const BusinessDetailsView({super.key, required this.business});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BusinessDetailViewModel(),
      builder: (context, model, child) {
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
                  AppText(
                    business.businessName,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 6),
                  AppText(
                    business.businessEmail,
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      AppText(
                        business.accountNumber,
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          if (!business.accredited) {
                            if (business.consentUrl.isNotEmpty) {
                              launchUrlStart(url: business.consentUrl);
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                              color: business.accredited
                                  ? Colors.transparent
                                  : AppColors.errorRed,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Icon(
                                business.accredited
                                    ? Icons.check_circle
                                    : Icons.cancel_rounded,
                                color: business.accredited
                                    ? Colors.green
                                    : Colors.white,
                                size: 25,
                              ),
                              const SizedBox(width: 5),
                              AppText(
                                business.accredited
                                    ? 'Verified'
                                    : 'Not Verified',
                                fontSize: 18,
                                color: business.accredited
                                    ? AppColors.black
                                    : AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const AppRectangle(
                    color: AppColors.lightGreen,
                    radius: 10,
                    height: 150,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            'Total Transaction Amount',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          SizedBox(height: 10),
                          AppText(
                            "₦5,000",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AppRectangle(
                    color: AppColors.lightGreen,
                    radius: 10,
                    height: 150,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            'Transaction Count',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          SizedBox(height: 10),
                          AppText(
                            "50",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AppRectangle(
                    color: AppColors.lightBlack,
                    radius: 10,
                    height: 150,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            'Total POS Device',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          SizedBox(height: 10),
                          AppText(
                            "1",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AppRectangle(
                    color: AppColors.lightGreen,
                    radius: 10,
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            'Today Transaction Amount',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          SizedBox(height: 10),
                          AppText(
                            "₦5,000",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          Spacer(),
                          AppText(
                            'Today Transaction Count',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                          SizedBox(height: 10),
                          AppText(
                            "5",
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const AppText(
                    "Business Infomation",
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 25),
                  BusinessInfoRow(
                    title: 'Business Name:',
                    subtitle: business.businessName,
                  ),
                  BusinessInfoRow(
                    title: 'Business Phone:',
                    subtitle: business.businessPhone,
                  ),
                  BusinessInfoRow(
                    title: 'Business Email:',
                    subtitle: business.businessEmail,
                  ),
                  BusinessInfoRow(
                    title: 'Business Type:',
                    subtitle: business.businessType,
                  ),
                  BusinessInfoRow(
                    title: 'Business Address:',
                    subtitle: business.businessAddress,
                  ),
                  // const SizedBox(height: 25),
                  // AppText(
                  //   "Contact Person",
                  //   fontSize: 25,
                  //   fontWeight: FontWeight.w700,
                  //   color: AppColors.black,
                  // ),
                  // const SizedBox(height: 25),
                  // BusinessInfoRow(

                  //   title: 'Full Name:',
                  //   subtitle:
                  //       "${business.contactPerson.firstName} ${business.contactPerson.lastName}",
                  // ),
                  // BusinessInfoRow(
                  //   title: 'Full Name:',
                  //   subtitle: business.contactPerson.

                  // ),
                  const SizedBox(height: 45),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
