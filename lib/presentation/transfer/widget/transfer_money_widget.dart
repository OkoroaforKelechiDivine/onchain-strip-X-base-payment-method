import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/number_formater.dart';
import 'package:pay_me_mobile/presentation/transfer/proceed_with_transfer/proceed_with_transfer_vm.dart';

class TransferMoneyField extends StatelessWidget {
  final ProceedWithTransferVM model;
  final Function() onSendMondey;
  const TransferMoneyField(
      {super.key, required this.model, required this.onSendMondey});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: const AppText(
                "₦ 500,000",
                fontSize: 12,
                color: AppColors.lightGrey,
              ),
            ),
          ),
          const SizedBox(height: 8),
          AppCustomTextField(
            textInputType: TextInputType.number,
            focusBorderColor: AppColors.transparentDeep,
            inputFormatters: [NumericTextFormatter()],
            hintText: "N500,000",
            backgroundColor: AppColors.white,
            maxLines: 1,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top: 14, left: 16),
              child: AppText(
                " ₦",
                color: AppColors.black,
              ),
            ),
            containerPadding: const EdgeInsets.all(0),
            borderRadius: 8.r,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            borderColor: AppColors.darkWhite,
            textEditingController: model.amount,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: AppCustomTextField(
                  focusBorderColor: AppColors.transparentDeep,
                  containerPadding: const EdgeInsets.all(0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  borderRadius: 8.r,
                  hintText: "Description",
                  backgroundColor: AppColors.white,
                  maxLines: 1,
                  borderColor: AppColors.darkWhite,
                  textEditingController: model.description,
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: onSendMondey,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.deepGreen,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: const Icon(
                    CupertinoIcons.paperplane_fill,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
