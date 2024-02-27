import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/component/user_tile.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/update_admin/update_admin_view.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/user_mangement_view_model.dart';

class AdminTab extends StatelessWidget {
  final UserManagementHomeVM model;
  const AdminTab({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Builder(
        builder: (context) {
          if (model.isLoadingAdmin) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 50, width: 50, child: CircularProgressIndicator()),
              ],
            );
          }
          if (model.adminList.isEmpty) {
            return const Center(
                child: AppText("No Admin found. Create New Admin"));
          }
          return ListView.separated(
            //reverse: true,
            itemCount: model.adminList.length,
            //hrinkWrap: true,
            itemBuilder: (context, index) {
              final admin = model.adminList[index];
              return GestureDetector(
                onTap: () {
                  navigationService.push(UpdateAdminView(
                    admin: admin,
                    customers: model.roleList,
                    onPop: () {
                      model.init();
                    },
                  ));
                },
                child: UserTile(
                  title: "${admin.firstName} ${admin.lastName}",
                  subtitle: admin.email,
                  status: admin.active ? "Active" : "Inactive",
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16);
            },
          );
        },
      ),
    );
  }
}
