import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/src/views/screens/home/home_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/pos/set_pos_screen.dart';
import 'package:pay_me_mobile/src/views/screens/raise_payment/raise_payment.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/buy_airtime/buy_airtime_screen.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_to_bank_screen.dart';

import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/src/views/screens/home/widgets/home_card_cta.dart';
import 'package:pay_me_mobile/src/views/screens/home/widgets/shadow_wrapper.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';
import '../../../../app_config/manager/font_manager.dart';

import '../outlet/outlet_screen.dart';

import '../tv/cable_tv.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (model) {
        model.init();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, _) {
        return RefreshIndicator(
          onRefresh: () async {
            return await model.getWalletBalance();
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Hi, ${appGlobals.user?.firstName}',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
              child: Column(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    model.isVisible
                                        ? model.walletBalance
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
                                  model.onToggleVisibility();
                                },
                              ),
                            ],
                          ),
                          Text(
                            'ACCOUNT NUMBER: 157766678939',
                            style: sans(),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Account Type: MERCHANT',
                            style: sans(),
                          ),
                          const SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeCardCTA(
                                  title: 'Add Money',
                                  asset: 'assets/jpg/add_money.jpg',
                                  onPressed: () {},
                                ),
                                HomeCardCTA(
                                  title: 'Transfer',
                                  asset: 'assets/jpg/transfer.jpg',
                                  onPressed: () {
                                    navigationService
                                        .push(const TransferToBankScreen());
                                    // pushNavigation(
                                    //     context: context,
                                    //     widget: const TransferToBankScreen());
                                  },
                                ),
                                HomeCardCTA(
                                  title: 'POS Device',
                                  asset: 'assets/jpg/pos_device.jpg',
                                  onPressed: () {
                                    navigationService
                                        .push(const PosDeviceScreen());
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
                  // money transfer
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Money Transfer',
                            style: inter(fontSize: 14.sp),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: HomeCardCTA(
                                  title: 'To Bank',
                                  asset: 'assets/jpg/bank.jpg',
                                  textColor: AppColors.lightGreen,
                                  onPressed: () {
                                    // todo: From Beneficiary --->
                                    // pushNavigation(context: context, widget: SendMoneyScreen(bank: DummyBank("Kuda Bank", "assets/jpg/kudabank_logo.jpg", "Ifeoluwa Rabiu", "1234567890",DateTime(2023, 2, 12), "Approved"),));
                                  },
                                ),
                              ),
                              Expanded(
                                child: HomeCardCTA(
                                  title: 'Payment',
                                  asset: 'assets/jpg/raise_payment.jpg',
                                  textColor: AppColors.lightGreen,
                                  onPressed: () {
                                    navigationService
                                        .push(const RaisePaymentScreen());
                                    //pushNavigation(context: context, widget: RaisePaymentScreen());
                                  },
                                ),
                              ),
                              const Expanded(
                                child: HomeCardCTA(
                                  title: 'Approve Payment',
                                  asset: 'assets/jpg/approved_payment.jpg',
                                  textColor: AppColors.lightGreen,
                                ),
                              ),
                            ],
                          ),
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
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'More',
                                style:
                                    sans(color: Colors.grey, fontSize: 12.sp),
                              ),
                              Icon(
                                Icons.chevron_right_outlined,
                                size: 12.sp,
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              navigationService.push(const OutletScreen());
                              //pushNavigation(context: context, widget: OutletScreen());
                            },
                            child: const ShadowWrapper(
                              child: HomeCardCTA(
                                asset: "assets/jpg/outlet.jpg",
                                title: 'Outlets',
                                textColor: AppColors.lightGreen,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: const ShadowWrapper(
                              child: HomeCardCTA(
                                asset: "assets/jpg/history.jpg",
                                title: 'Transaction\nHistory',
                                textColor: AppColors.lightGreen,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: ShadowWrapper(
                              child: HomeCardCTA(
                                asset: "assets/jpg/mobile.jpg",
                                title: 'Buy Airtime',
                                textColor: AppColors.lightGreen,
                                onPressed: () {
                                  navigationService
                                      .push(const BuyAirtimeScreen());
                                },
                              ),
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
                    height: 95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: const ShadowWrapper(
                              child: HomeCardCTA(
                                asset: "assets/jpg/buy_power.jpg",
                                title: 'Buy Power',
                                textColor: AppColors.lightGreen,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: const ShadowWrapper(
                              child: HomeCardCTA(
                                asset: "assets/jpg/pos_device.jpg",
                                title: 'POS Device',
                                textColor: AppColors.lightGreen,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              navigationService.push(const CableTvScreen());

                              //pushNavigation(context: context, widget: CableTvScreen());
                            },
                            child: const ShadowWrapper(
                              child: HomeCardCTA(
                                asset: "assets/jpg/more.jpg",
                                title: 'More',
                                textColor: AppColors.lightGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
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
