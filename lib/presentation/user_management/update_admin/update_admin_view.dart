import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/core/widgets/app_button.dart';
import 'package:pay_me_mobile/core/widgets/app_text_field.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_admin_list_res.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';
import 'package:pay_me_mobile/presentation/invoice/components/invoice_custom_header.dart';
import 'package:pay_me_mobile/presentation/user_management/update_admin/update_admin_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/app_text.dart';

class UpdateAdminView extends StatelessWidget {
  final GetAdminListRes admin;
  final List<GetRoleListRes> customers;
  final Function() onPop;
  const UpdateAdminView(
      {super.key,
      required this.onPop,
      required this.customers,
      required this.admin});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (viewModel) {
        viewModel.setText(admin, customers);
      },
      viewModelBuilder: () => UpdateAdminViewModel(),
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
                    "Update Admin",
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
                  const SizedBox(height: 38),
                  AppCustomButton(
                    loading: viewModel.isLoading,
                    title: "Save",
                    onPressed: () {
                      viewModel.createAdmin(onPop, admin.id.toString());
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
