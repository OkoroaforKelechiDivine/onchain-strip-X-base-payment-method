  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:pay_me_mobile/presentation/auth/sign_up/sign_up_viewmodel.dart';
  import '../../../../core/cores.dart';

  class CreatePinPage extends StatelessWidget {
    final SignUpViewModel model;
    const CreatePinPage({super.key, required this.model});

    @override
    Widget build(BuildContext context) {
      return Form(
        key: model.createPinFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: AppText(
                "Create Login Pin",
                color: AppColors.deepGreen,
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
            ),
            AppCustomTextField(
              focusBorderColor: AppColors.white,
              hintText: "Create Login Pin",
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.createPin,
              textInputType: TextInputType.number,
              maxLength: 6,
              obscureText: true,
              maxLines: 1,
            ),
            AppCustomTextField(
              focusBorderColor: AppColors.white,
              hintText: "Confirm Login Pin",
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.confirmPin,
              textInputType: TextInputType.number,
              maxLength: 6,
              obscureText: true,
              maxLines: 1,
            ),
          ],
        ),
      );
    }
  }
