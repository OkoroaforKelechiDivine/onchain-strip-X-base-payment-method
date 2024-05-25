import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/sign_up_viewmodel.dart';

import '../../../../core/cores.dart';

class BusinessInfo extends StatelessWidget {
  final SignUpViewModel model;
  const BusinessInfo({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.businessFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: AppText(
                "Business Information",
                color: AppColors.deepGreen,
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
            ),
            AppCustomTextField(
              hintText: "Business name",
              focusBorderColor: AppColors.white,
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.businessName,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Business name is required";
                }
                return null;
              },
            ),
            AppCustomTextField(
              focusBorderColor: AppColors.white,
              hintText: "Business address",
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.businessAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Business address is required";
                }
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: AppDropDown(
                    hint: "Business registration status",
                    list: model.registrationOptions,
                    selected: model.registrationStatusIndex,
                    onChangeValue: (value) {
                      model.onRegistrationStatusChanged(value);
                    },
                    borderRadius: 8,
                    borderWidth: 1,
                    height: 45.h,
                    borderColor: AppColors.darkWhite,
                    background: AppColors.white,
                    textColor: AppColors.grey,
                    dropDownTextColor: AppColors.grey,
                    dropDownTextSize: 15.sp,
                  ),
                ),
              ],
            ),
            Visibility(
              visible: model.registrationStatusIndex == 0,
              child: Column(
                children: [
                  Stack(
                    children: [
                      AppCustomTextField(
                        hintText: "Incorporate date",
                        disableTyping: true,
                        focusBorderColor: AppColors.white,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.darkWhite,
                        textEditingController: model.incorporateDateController,
                        validator: (value) {
                          if (model.registrationStatusIndex == 0 &&
                              value!.isEmpty) {
                            return "Incorporate date is required";
                          }
                          return null;
                        },
                      ),
                      Positioned(
                        right: 20,
                        top: 20,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (pickedDate != null) {
                              final formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              model.setIncorporateDate(formattedDate);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.calendar_month,
                                color: AppColors.demonicGreen, size: 16.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppCustomTextField(
                    focusBorderColor: AppColors.white,
                    hintText: "RC number",
                    backgroundColor: AppColors.white,
                    borderColor: AppColors.darkWhite,
                    textEditingController: model.rcNumber,
                    validator: (value) {
                      if (model.registrationStatusIndex == 0 &&
                          value!.isEmpty) {
                        return "RC number is required";
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
