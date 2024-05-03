import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/presentation/invoice/components/invoice_custom_header.dart';
import 'package:pay_me_mobile/presentation/user_management/create_admin/create_admin.dart';
import 'package:pay_me_mobile/presentation/user_management/create_roles/create_role.dart';
import 'package:pay_me_mobile/presentation/user_management/tabs/admins_tab.dart';
import 'package:pay_me_mobile/presentation/user_management/tabs/role_tab.dart';
import 'package:pay_me_mobile/presentation/user_management/user_mangement_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../core/widgets/app_text.dart';

class UserManagementHome extends StatelessWidget {
  const UserManagementHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UserManagementHomeVM(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return RefreshIndicator(
          key: model.refreshKey,
          onRefresh: () async {
            await model.init();
          },
          child: GestureDetector(
            onVerticalDragStart: (dragDetails) {
              model.startVerticalDragDetailsY = dragDetails.globalPosition.dy;
            },
            onVerticalDragUpdate: (dragDetails) {
              model.updateVerticalDragDetailsY = dragDetails.globalPosition.dy;
            },
            onVerticalDragEnd: (endDetails) {
              if (model.startVerticalDragDetailsY <
                  model.updateVerticalDragDetailsY) {
                // User dragged down
                model.refreshKey.currentState?.show();
              }
            },
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: AppColors.invoiceBg,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 30 + 56),
                      const InvoiceCustomHeader(),
                      const SizedBox(height: 18),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            model.currentIndex == 0 ? 'Admin' : "Roles",
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (model.currentIndex == 0) {
                                navigationService.push(CreateAdminView(
                                  onPop: () {
                                    model.init();
                                  },
                                  //invoiceNumber: model.invoiceList.length + 1,
                                  customers: model.roleList,
                                ));
                              } else {
                                navigationService.push(CreateRoleView(
                                  onPop: model.init,
                                ));
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  AppText(
                                    model.currentIndex == 0
                                        ? "Create Admin"
                                        : "Create Role",
                                    fontSize: 16,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(AppAssets.add),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 33),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 22),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFC),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TabBar(
                                  onTap: model.setIndex,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  tabs: const [
                                    Tab(text: 'Admins'),
                                    Tab(text: 'Roles'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    AdminTab(
                                      model: model,
                                    ),
                                    RolesTab(
                                      model: model,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
