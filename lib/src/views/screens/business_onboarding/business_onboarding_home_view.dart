import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';
import 'package:pay_me_mobile/src/views/screens/business_onboarding/business_onboarding_home_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/business_onboarding/components/bussiness_tile.dart';
import 'package:pay_me_mobile/src/views/screens/business_onboarding/create_business/create_business_view.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';
import 'business_detail/business_details_view.dart';

class BusinessOnboardingHomeView extends StatelessWidget {
  const BusinessOnboardingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BusinessOnboardingHomeVM(),
      onModelReady: (viewModel) {
        viewModel.init();
      },
      builder: (context, model, child) {
        return RefreshIndicator(
          key: model.refreshKey,
          onRefresh: () async {
            await model.init();
          },
          child: GestureDetector(
            onVerticalDragStart: (dragDetails) {
              model.startVerticalDragDetailsY = dragDetails.globalPosition.dy;
            },
            onVerticalDragUpdate: (dragDetails) {
              model.updateVerticalDragDetailsY = dragDetails.globalPosition.dy;
            },
            onVerticalDragEnd: (endDetails) {
              if (model.startVerticalDragDetailsY <
                  model.updateVerticalDragDetailsY) {
                // User dragged down
                model.refreshKey.currentState?.show();
              }
            },
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
                        const Expanded(
                          child: AppText(
                            "Business",
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            navigationService.push(CreateBusinessView(
                              onPop: () {
                                model.init();
                              },
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const AppText(
                                  "Create Business",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
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
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 22),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: Builder(
                            builder: (context) {
                              if (model.isLoadingRoles) {
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
                              if (model.businessList.isEmpty) {
                                return const Center(
                                  child: AppText(
                                    "No Business found. Create New Business",
                                  ),
                                );
                              }
                              return ListView.separated(
                                itemCount: model.businessList.length,
                                //hrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final business = model.businessList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      navigationService
                                          .push(BusinessDetailsView(
                                        business: business,
                                      ));
                                    },
                                    child: BusinessTile(
                                      title: business.businessName,
                                      subtitle: business.businessEmail,
                                      status: business.active,
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 16);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
