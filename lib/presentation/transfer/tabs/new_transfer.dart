import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/transfer/proceed_with_transfer/proceed_with_transfer.dart';
import 'package:pay_me_mobile/presentation/transfer/transfer_viewmodel.dart';

import '../../../core/constants/app_assets.dart';

class NewTransfer extends StatelessWidget {
  final TransferViewModel model;
  const NewTransfer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            model.onShowBank();
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.darkWhite, width: 1),
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: model.selectedBank == null,
                        replacement: Row(
                          children: [
                            SvgPicture.asset(
                              AppAssets.bankIcon,
                              height: 36,
                              width: 36,
                            ),
                            const SizedBox(width: 10),
                            AppText(
                              model.selectedBank?.name ?? "",
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        child: const AppText(
                          'Select Bank',
                          color: AppColors.transferSelectBank,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.dropDownBg,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_drop_down,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        AppCustomTextField(
          focusBorderColor: AppColors.white,
          hintText: "Enter account number",
          backgroundColor: AppColors.white,
          borderColor: AppColors.darkWhite,
          textEditingController: model.accountNumber,
          onChanged: (value) {
            if (value.length == 10) {
              model.getBeneficiaryDetails();
            } else {
              model.resetBeneficiary();
            }
          },
          textInputType: TextInputType.number,
          containerPadding: const EdgeInsets.symmetric(horizontal: 20),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const AppText(
                    "Paste",
                    color: AppColors.demonicGreen,
                    fontWeight: AppFontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    AppAssets.copy,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Builder(
          builder: (context) {
            if (model.isLoadingbeneficiaryDetail) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    )),
              );
            }
            if (model.beneficiaryDetailResponse != null) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppText(
                  model.beneficiaryDetailResponse!.name,
                  color: AppColors.lightYellow,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              );
            }
            return Container();
          },
        ),
        const Spacer(),
        Visibility(
          visible: model.beneficiaryDetailResponse != null,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppButton(
              title: "Next",
              radius: 100.r,
              onPressed: () {
                if (model.beneficiaryDetailResponse != null &&
                    model.selectedBank != null) {
                  navigationService.push(ProceedWithTransfer(
                    beneficiaryDetail: model.beneficiaryDetailResponse!,
                    selectedBank: model.selectedBank!,
                  ));
                }
              },
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
