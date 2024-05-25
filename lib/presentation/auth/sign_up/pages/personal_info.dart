import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/components/gender_selection.dart';
import 'package:pay_me_mobile/presentation/auth/sign_up/sign_up_viewmodel.dart';

import '../../../../core/cores.dart';

class PersonalInfo extends StatelessWidget {
  final SignUpViewModel model;
  const PersonalInfo({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.personalInfoFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: AppText(
                "Personal Information",
                color: AppColors.deepGreen,
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
            ),
            AppCustomTextField(
              hintText: "Last name",
              focusBorderColor: AppColors.white,
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.lastName,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Last name is required";
                }
                return null;
              },
            ),
            AppCustomTextField(
              focusBorderColor: AppColors.white,
              hintText: "First name",
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.firstName,
              validator: (value) {
                if (value!.isEmpty) {
                  return "First name is required";
                }
                return null;
              },
            ),
            AppCustomTextField(
              focusBorderColor: AppColors.white,
              hintText: "Username",
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.username,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username is required";
                }
                return null;
              },
            ),
            AppCustomTextField(
              focusBorderColor: AppColors.white,
              hintText: "Email address",
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email address is required";
                }
                return null;
              },
            ),
            AppCustomTextField(
              focusBorderColor: AppColors.white,
              hintText: "BVN",
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.bvn,
              textInputType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "BVN is required";
                }
                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: AppDropDown(
                    hint: "State",
                    list: model.stateOptions,
                    selected: model.stateIndex,
                    onChangeValue: (value) {
                      model.onStateChanged(value);
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
            GenderSelectionWidget(
              selectedIndex: model.genderIndex,
              onChanged: (value) {
                model.onGenderChanged(value);
              },
            ),
            AppCustomTextField(
              focusBorderColor: AppColors.white,
              hintText: "Phone number",
              prefixIcon: const Padding(
                padding: EdgeInsets.only(top: 15, left: 10),
                child: AppText(
                  "+234 |  ",
                  color: AppColors.transparentDeep,
                ),
              ),
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.phoneNumber,
              textInputType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Phone number is required";
                }
                return null;
              },
            ),
            Stack(
              children: [
                AppCustomTextField(
                  hintText: "DOB",
                  disableTyping: true,
                  focusBorderColor: AppColors.white,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.darkWhite,
                  textEditingController: model.dob,
                  validator: (value) {
                    if (model.registrationStatusIndex == 0 && value!.isEmpty) {
                      return "DOB is required";
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
                        model.setDOBDate(formattedDate);
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
              hintText: "Password",
              backgroundColor: AppColors.white,
              borderColor: AppColors.darkWhite,
              textEditingController: model.password,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
