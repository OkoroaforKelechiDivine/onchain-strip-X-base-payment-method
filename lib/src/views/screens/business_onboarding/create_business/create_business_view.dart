import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/src/views/screens/business_onboarding/create_business/create_business_viewmodel.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/cores.dart';

class CreateBusinessView extends StatelessWidget {
  final Function()? onPop;
  const CreateBusinessView({super.key, required this.onPop});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreateBusinessVm(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: model.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30 + 56),
                    const InvoiceCustomHeader(),
                    const SizedBox(height: 18),
                    const AppText(
                      "Create Business",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const SizedBox(height: 38),
                    const AppText(
                      "Business Type",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          // The current value of the dropdown.
                          value: model.selectedBusinessType,
                          // Called when the user selects an item.
                          onChanged: (String? newValue) {
                            //model.selectedDropdownItem = newValue;
                            model.selectBusinessType(newValue);
                          },
                          // The list of items the user can select.
                          items: model.bussinessType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // Customization for the dropdown button.
                          isExpanded: true,
                          hint: const Text('Select Business Type'),
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Business Infomation",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const SizedBox(height: 38),
                    const AppText(
                      "Business Name",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "Business Name",
                      textEditingController: model.businessNameController,
                      backgroundColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Business Name is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Business Phone Number",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "Business Phone Number",
                      textEditingController: model.businessPhoneController,
                      backgroundColor: Colors.white,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Business Phone Number is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Email Address",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "Email Address",
                      textEditingController: model.businessEmailController,
                      backgroundColor: Colors.white,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email Address is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Registration Status",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          // The current value of the dropdown.
                          value: model.registrationStatus,
                          // Called when the user selects an item.
                          onChanged: (String? newValue) {
                            //model.selectedDropdownItem = newValue;
                            model.selectRegistrationStatusType(newValue!);
                          },
                          // The list of items the user can select.
                          items: model.registrationStatusType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // Customization for the dropdown button.
                          isExpanded: true,
                          hint: const Text('Select Registration Status'),
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Visibility(
                      visible: model.registrationStatus == "Registered",
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            "RC Number",
                            fontSize: 14,
                          ),
                          const SizedBox(height: 8),
                          AppCustomTextField(
                            hintText: "RC Number",
                            textEditingController: model.rcNumberController,
                            backgroundColor: Colors.white,
                            textInputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            borderColor: Colors.transparent,
                          ),
                          const SizedBox(height: 28),
                          const AppText(
                            "Incoporation Date",
                            fontSize: 14,
                          ),
                          const SizedBox(height: 8),
                          GestureDetector(
                            onTap: () {
                              model.selectIncoporationDate(context);
                            },
                            child: Container(
                              height: 50.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.lightGreen,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      "${model.selectedIncoporationDate.toLocal()}"
                                          .split(' ')[0],
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    const Icon(
                                      Icons.calendar_today,
                                      color: AppColors.lightGreen,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 28),
                        ],
                      ),
                    ),
                    const AppText(
                      "Business Address",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "Business Address",
                      textEditingController: model.businessAddressController,
                      backgroundColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Business Address is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Contact Infomation",
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                    const SizedBox(height: 38),
                    const AppText(
                      "First Name",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "First Name",
                      textEditingController: model.firstnameController,
                      backgroundColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "First Name is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Last Name",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "Last Name",
                      textEditingController: model.lastnameController,
                      backgroundColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Last Name is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Middle Name",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "Middle Name",
                      textEditingController: model.middleNameController,
                      backgroundColor: Colors.white,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Middle Name is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Select Gender",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          // The current value of the dropdown.
                          value: model.gender,
                          // Called when the user selects an item.
                          onChanged: (String? newValue) {
                            //model.selectedDropdownItem = newValue;
                            model.selectGender(newValue!);
                          },
                          // The list of items the user can select.
                          items: model.genderType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          // Customization for the dropdown button.
                          isExpanded: true,
                          hint: const Text('Select Gender'),
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Select DOB",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        model.selectDOB(context);
                      },
                      child: Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightGreen,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                "${model.selectedDOB.toLocal()}".split(' ')[0],
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                              const Icon(
                                Icons.calendar_today,
                                color: AppColors.lightGreen,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "BVN Number",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "BVN Number",
                      textEditingController: model.bvnController,
                      backgroundColor: Colors.white,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 11,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "BVN Number is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 28),
                    const AppText(
                      "Username",
                      fontSize: 14,
                    ),
                    const SizedBox(height: 8),
                    AppCustomTextField(
                      hintText: "Username",
                      textEditingController: model.usernameController,
                      backgroundColor: Colors.white,
                      onChanged: (value) {
                        model.checkUsername();
                      },
                      // onSubmitted: (p0) {
                      //   model.checkUsername();
                      // },
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username is required";
                        }
                        return null;
                      },
                      borderColor: Colors.transparent,
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                      visible: (model.isUsernameAvailable != null ||
                          model.checkingUsername == true),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.lightGreen.withOpacity(0.1),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            model.checkingUsername
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColors.lightGreen,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Icon(
                                    Icons.check_circle_rounded,
                                    color: AppColors.lightGreen,
                                  ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                model.checkingUsername == true
                                    ? "Checking account number.."
                                    : model.isUsernameAvailable == false
                                        ? "Username is available"
                                        : "Username is not available",
                                style: const TextStyle(
                                  color: AppColors.lightGreen,
                                  fontWeight: AppFontWeight.bold,
                                  fontSize: AppFontSize.size14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 38),
                    AppCustomButton(
                      loading: model.isLoading,
                      title: "Save",
                      onPressed: () {
                        model.validateForm(onPop);
                      },
                      color: AppColors.black,
                    ),
                    const SizedBox(height: 18),
                    AppCustomButton(
                      elevation: 0,
                      // title: "Save",
                      onPressed: () {
                        navigationService.pop();
                      },
                      borderColor: AppColors.black,
                      color: Colors.transparent,
                      borderWidth: 1,
                      child: const AppText(
                        "Cancel",
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 38),
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
