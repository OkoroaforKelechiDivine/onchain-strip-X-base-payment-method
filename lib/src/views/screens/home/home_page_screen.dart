import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/utilities/permission.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/src/views/screens/business_onboarding/business_onboarding_home_view.dart';
import 'package:pay_me_mobile/src/views/screens/home/add_money_view.dart';
import 'package:pay_me_mobile/src/views/screens/home/home_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/inflow/inflow_screen.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/invoice_home.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/transaction_history.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/buy_airtime_screen.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_power/buy_power_screen.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_to_bank_screen.dart';

import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/src/views/screens/home/widgets/home_card_cta.dart';
import 'package:pay_me_mobile/src/views/screens/home/widgets/shadow_wrapper.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/user_management_home_view.dart';
import 'package:stacked/stacked.dart';
import '../../../../app_config/manager/font_manager.dart';

import '../tv/cable_tv.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, _) {
        return RefreshIndicator(
          key: model.refreshKey,
          onRefresh: () async {
            return await model.init();
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
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.white,
                centerTitle: false,
                title: AppText(
                  'Hi, ${appGlobals.user?.business}',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Builder(builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      // Card
                      Card(
                        color: AppColors.lightGreen,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15.0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "₦ ",
                                        style: TextStyle(
                                            fontSize: AppFontSize.size30,
                                            color: Colors.white,
                                            fontFamily: ""),
                                      ),
                                      Text(
                                        model.isLoadingWalletBalance
                                            ? "----"
                                            : model.isVisible
                                                ? formatBalance(double.parse(
                                                    model.walletBalance))
                                                : '*********',
                                        style: philosopher(
                                            color: Colors.white,
                                            fontSize: 28.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      model.isVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppColors.deepWhite,
                                    ),
                                    onPressed: () {
                                      log(Permissions()
                                          .canUserViewBalance()
                                          .toString());
                                      if (Permissions().canUserViewBalance()) {
                                        model.onToggleVisibility();
                                      } else {
                                        snackbarService.error(
                                            message:
                                                "Can't Perform this Operation");
                                      }
                                    },
                                  ),
                                ],
                              ),
                              // Text(
                              //   'ACCOUNT NUMBER: 157766678939',
                              //   style: sans(),
                              // ),
                              // const SizedBox(height: 5),
                              // Text(
                              //   'Account Type: MERCHANT',
                              //   style: sans(),
                              // ),
                              const SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    HomeCardCTA(
                                      title: 'Add Money',
                                      asset: 'assets/jpg/add_money.jpg',
                                      onPressed: () {
                                        bottomSheetService
                                            .show(const AddMoneyView());
                                      },
                                    ),
                                    HomeCardCTA(
                                      title: 'Transfer',
                                      asset: 'assets/jpg/transfer.jpg',
                                      onPressed: () {
                                        log(Permissions()
                                            .canUserTransfer()
                                            .toString());
                                        if (Permissions().canUserTransfer()) {
                                          navigationService.push(
                                              const TransferToBankScreen());
                                        } else {
                                          snackbarService.error(
                                              message:
                                                  "Can't Perform this Operation");
                                        }

                                        // pushNavigation(
                                        //     context: context,
                                        //     widget: const TransferToBankScreen());
                                      },
                                    ),
                                    HomeCardCTA(
                                      title: 'Invoice',
                                      asset: AppAssets.invoice,
                                      onPressed: () {
                                        navigationService
                                            .push(const InvoiceHomeScreen());
                                        // log(Permissions()
                                        //     .canUserViewPosDevices()
                                        //     .toString());
                                        // if (Permissions()
                                        //     .canUserViewPosDevices()) {
                                        //   snackbarService.success(
                                        //       message: "Coming Soon");
                                        //   // navigationService
                                        //   //     .push(const PosDeviceScreen());
                                        // } else {
                                        //   snackbarService.error(
                                        //       message:
                                        //           "Can't Perform this Operation");
                                        // }

                                        //pushNavigation(context: context, widget: const PosDeviceScreen());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      // Services Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Services',
                            style: inter(fontSize: 14.sp),
                          ),
                          // TextButton(
                          //     onPressed: () {},
                          //     child: Row(
                          //       children: [
                          //         Text(
                          //           'More',
                          //           style:
                          //               sans(color: Colors.grey, fontSize: 12.sp),
                          //         ),
                          //         Icon(
                          //           Icons.chevron_right_outlined,
                          //           size: 12.sp,
                          //         )
                          //       ],
                          //     ))
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ShadowWrapper(
                                child: HomeCardCTA(
                                  asset: "assets/jpg/outlet.jpg",
                                  title: 'Inflow',
                                  textColor: AppColors.lightGreen,
                                  onPressed: () {
                                    navigationService
                                        .push(const InflowScreen());
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                              child: ShadowWrapper(
                                child: HomeCardCTA(
                                  asset: "assets/jpg/history.jpg",
                                  title: 'Transaction\nHistory',
                                  textColor: AppColors.lightGreen,
                                  fontSize: 13,
                                  onPressed: () {
                                    log(Permissions()
                                        .canUserViewAllTransactions()
                                        .toString());
                                    if (Permissions()
                                        .canUserViewAllTransactions()) {
                                      navigationService.push(
                                          const TransactionHistoryScreen());
                                    } else {
                                      snackbarService.error(
                                          message:
                                              "Can't Perform this Operation");
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                              child: ShadowWrapper(
                                child: HomeCardCTA(
                                  asset: "assets/jpg/mobile.jpg",
                                  title: 'Buy Airtime',
                                  textColor: AppColors.lightGreen,
                                  onPressed: () {
                                    log(Permissions()
                                        .canUserTransfer()
                                        .toString());
                                    if (Permissions().canUserTransfer()) {
                                      navigationService
                                          .push(const BuyAirtimeScreen());
                                    } else {
                                      snackbarService.error(
                                          message:
                                              "Can't Perform this Operation");
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ShadowWrapper(
                                child: HomeCardCTA(
                                  asset: "assets/jpg/buy_power.jpg",
                                  title: 'Buy Power',
                                  textColor: AppColors.lightGreen,
                                  onPressed: () {
                                    log(Permissions()
                                        .canUserTransfer()
                                        .toString());
                                    if (Permissions().canUserTransfer()) {
                                      navigationService
                                          .push(const BuyPowerScreen());
                                    } else {
                                      snackbarService.error(
                                          message:
                                              "Can't Perform this Operation");
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                              child: ShadowWrapper(
                                child: HomeCardCTA(
                                  asset: "assets/jpg/more.jpg",
                                  title: 'Tv Cable',
                                  textColor: AppColors.lightGreen,
                                  onPressed: () {
                                    log(Permissions()
                                        .canUserTransfer()
                                        .toString());
                                    if (Permissions().canUserTransfer()) {
                                      navigationService
                                          .push(const CableTvScreen());
                                    } else {
                                      snackbarService.error(
                                        message: "Can't Perform this Operation",
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                              child: Visibility(
                                visible: (appGlobals.user?.business == "PayMe"),
                                replacement: ShadowWrapper(
                                  child: HomeCardCTA(
                                    asset: "assets/png/user-management.png",
                                    title: 'Manage User',
                                    textColor: AppColors.lightGreen,
                                    fontSize: 13,
                                    onPressed: () {
                                      log(Permissions()
                                          .canUserViewPosDevices()
                                          .toString());
                                      if (Permissions().canUserCreateRole()) {
                                        navigationService
                                            .push(const UserManagementHome());
                                      } else {
                                        snackbarService.error(
                                            message:
                                                "Can't Perform this Operation");
                                      }
                                    },
                                  ),
                                ),
                                child: ShadowWrapper(
                                  child: HomeCardCTA(
                                    asset: "assets/png/deal.png",
                                    title: 'Onboarding',
                                    textColor: AppColors.lightGreen,
                                    fontSize: 13,
                                    onPressed: () {
                                      navigationService.push(
                                          const BusinessOnboardingHomeView());
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return RefreshIndicator(
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: const Center(
                    child: AppText("Home"),
                  ),
                ),
              ),
            ],
          ),
          onRefresh: () async {
            return await model.init();
          },
        );
      },
    );
  }
}
