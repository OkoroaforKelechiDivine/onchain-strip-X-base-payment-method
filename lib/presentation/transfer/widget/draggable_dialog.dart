import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/transfer/transfer_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../auth/pin/create_pin.dart';
import 'network_errorScreen.dart';

class DraggableDialog extends StatefulWidget {
  const DraggableDialog({super.key});

  @override
  _DraggableDialogState createState() => _DraggableDialogState();
}

class _DraggableDialogState extends State<DraggableDialog> {
  late ScrollController _scrollController;
  bool _isExpanded = false;
  bool _displayText = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter == 0) {
        setState(() {
          _isExpanded = true;
        });
      } else {
        setState(() {
          _isExpanded = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransferViewModel>.reactive(
      viewModelBuilder: () => TransferViewModel(),
      builder: (context, model, child) {
        return Stack(
          children: [
            DraggableScrollableSheet(
              initialChildSize: 0.1,
              minChildSize: 0.1,
              maxChildSize: 0.5,
              builder: (BuildContext context, ScrollController scrollController) {
                _scrollController = scrollController;
                return Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _displayText = !_displayText;
                      });
                    },
                    child: ListView(
                      controller: scrollController,
                      children: _displayText ? [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const AppText(
                                    "Complete Transaction Using Biometrics",
                                    color: AppColors.grey,
                                  ),
                                  const Spacer(),
                                  Image.asset(AppAssets.close),
                                ],
                              ),
                              Container(
                                height: 1,
                                color: AppColors.grey,
                              ),
                              SizedBox(height: 20.h),
                              const Row(
                                children: [
                                  Flexible(
                                    child: AppText(
                                      color: AppColors.grey,
                                      "350,000 to Access Bank, Jadesola Agbanidarego for top up",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 50.h),
                              Image.asset(
                                AppAssets.fingerPrint,
                                width: 35,
                                color: AppColors.demonicGreen
                              ),
                              SizedBox(height: 50.h),
                              const AppText("Scan Your Fingerprint", color: AppColors.grey,)
                            ],
                          ),
                        ),
                      ] : [
                        Container(
                          height: 50,
                          alignment: Alignment.topCenter,
                          child: Icon(
                            _isExpanded ? Icons.remove : Icons.keyboard_arrow_up,
                            color: Colors.grey,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                AppCustomTextField(
                                  textInputType: TextInputType.number,
                                  focusBorderColor: AppColors.transparentDeep,
                                  hintText: "N500,000",
                                  backgroundColor: AppColors.white,
                                  borderColor: AppColors.darkWhite,
                                  textEditingController: model.amount,
                                ),
                                AppCustomTextField(
                                  focusBorderColor: AppColors.transparentDeep,
                                  hintText: "Description",
                                  backgroundColor: AppColors.white,
                                  borderColor: AppColors.darkWhite,
                                  textEditingController: model.description,
                                ),
                                SizedBox(height: 70.h),
                                Row(
                                  children: [
                                    AppButton(
                                      onPressed: () {
                                        navigationService.push(const NetworkErrorScreen());
                                      },
                                      width: 250.w,
                                      color: AppColors.deepGreen,
                                      title: "Proceed",
                                      radius: 100.r,
                                      margin: const EdgeInsets.symmetric(horizontal: 20),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      AppAssets.fingerPrint,
                                      width: 35,
                                      color: AppColors.demonicGreen,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
