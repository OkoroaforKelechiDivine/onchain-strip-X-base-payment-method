import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/constants/font_weights.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';
import 'package:pay_me_mobile/presentation/invoice/components/invoice_custom_header.dart';
import 'package:pay_me_mobile/presentation/user_management/create_admin/create_admin_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../core/cores.dart';

class CreateAdminView extends StatelessWidget {
  final List<GetRoleListRes> customers;
  final Function() onPop;
  const CreateAdminView(
      {super.key, required this.onPop, required this.customers});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreateAdminViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.invoiceBg,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30 + 56),
                  const InvoiceCustomHeader(),
                  const SizedBox(height: 18),
                  const AppText(
                    "Add New Admin",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 38),
                  const AppText(
                    "Role",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<GetRoleListRes>(
                        // The current value of the dropdown.
                        value: viewModel.selectedRole,
                        // Called when the user selects an item.
                        onChanged: (GetRoleListRes? newValue) {
                          //viewModel.selectedDropdownItem = newValue;
                          viewModel.selectRole(newValue);
                        },
                        // The list of items the user can select.
                        items: customers.map<DropdownMenuItem<GetRoleListRes>>(
                            (GetRoleListRes value) {
                          return DropdownMenuItem<GetRoleListRes>(
                            value: value,
                            child: Text(value.label),
                          );
                        }).toList(),
                        // Customization for the dropdown button.
                        isExpanded: true,
                        hint: const Text('Select Role'),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "First Name",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter First Name",
                    textEditingController: viewModel.firstNameTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Last Name",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Last Name",
                    textEditingController: viewModel.lastNameTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Email Address",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Email Address",
                    textEditingController: viewModel.emailAddressTEC,
                    backgroundColor: Colors.white,
                    textInputType: TextInputType.emailAddress,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 24),
                  const AppText(
                    "Username",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Username",
                    onChanged: (value) {
                      viewModel.checkUsername();
                    },
                    textEditingController: viewModel.usernameTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 15),
                  if (viewModel.usernameTEC.text.isNotEmpty)
                    Visibility(
                      visible: (viewModel.isUsernameAvailable != null ||
                          viewModel.checkingUsername == true),
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
                            viewModel.checkingUsername
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColors.lightGreen,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Icon(
                                    viewModel.isUsernameAvailable == false ||
                                            viewModel.checkingUsername == true
                                        ? Icons.check_circle_rounded
                                        : Icons.cancel_rounded,
                                    color: viewModel.isUsernameAvailable ==
                                                false ||
                                            viewModel.checkingUsername == true
                                        ? AppColors.lightGreen
                                        : AppColors.errorRed,
                                  ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                viewModel.checkingUsername == true
                                    ? "Checking account number.."
                                    : viewModel.isUsernameAvailable == false
                                        ? "Username is available"
                                        : "Username is not available",
                                style: TextStyle(
                                  color:
                                      viewModel.isUsernameAvailable == false ||
                                              viewModel.checkingUsername == true
                                          ? AppColors.lightGreen
                                          : AppColors.errorRed,
                                  fontWeight: AppFontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 38),
                  AppCustomButton(
                    loading: viewModel.isLoading,
                    title: "Save",
                    onPressed: () {
                      viewModel.createAdmin(onPop);
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
        );
      },
    );
  }
}
