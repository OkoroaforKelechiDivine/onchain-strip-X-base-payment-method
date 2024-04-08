
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/core/widgets/app_button.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';
import 'package:pay_me_mobile/core/widgets/app_text_field.dart';
import 'package:pay_me_mobile/data/model/response/user_management/get_role_list_res.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/components/invoice_custom_header.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/create_roles/create_role_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreateRoleView extends StatelessWidget {
  final GetRoleListRes? role;
  final Function()? onPop;
  const CreateRoleView({super.key, this.onPop, this.role});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreateRolesViewModel(),
      onModelReady: (viewModel) {
        if (role != null) {
          viewModel.setRoles(role!);
        }
      },
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30 + 56),
                  const InvoiceCustomHeader(),
                  const SizedBox(height: 18),
                  AppText(
                    role != null ? "Update Role" : "Add New Role",
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                  const SizedBox(height: 38),
                  const AppText(
                    "Role Name",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  AppCustomTextField(
                    hintText: "Enter Role Name",
                    textEditingController: model.roleNameTEC,
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                  ),
                  const SizedBox(height: 28),
                  const AppText(
                    "Select Roles",
                    fontSize: 14,
                  ),
                  const SizedBox(height: 8),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: model.actions.length,
                      itemBuilder: (context, index) {
                        String key = model.actions.keys.elementAt(index);
                        return CheckboxListTile(
                          activeColor: AppColors.lightGreen,
                          title: Text(model.actions[key]!),
                          value: model.selectedActions.contains(key),
                          onChanged: (bool? value) {
                            model.handleCheckboxChange(value, key);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 38),
                  AppCustomButton(
                    loading: model.isLoading,
                    title: "Save",
                    onPressed: () {
                      model.createRole(onPop, role);
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
