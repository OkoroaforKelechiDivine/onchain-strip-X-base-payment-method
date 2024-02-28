import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
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
              return FocusedMenuHolder(
                menuWidth: MediaQuery.of(context).size.width * 0.50,
                blurSize: 5.0,
                menuItemExtent: 45,
                menuBoxDecoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                duration: const Duration(milliseconds: 100),
                animateMenuItems: true,
                blurBackgroundColor: Colors.black54,
                openWithTap:
                    false, // Open Focused-Menu on Tap rather than Long Press
                menuOffset:
                    10.0, // Offset value to show menuItem from the selected item
                bottomOffsetHeight: 80.0,
                menuItems: <FocusedMenuItem>[
                  FocusedMenuItem(
                    title: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    trailingIcon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      model.deleteAdmin(admin.username);
                    },
                  ),
                ],
                onPressed: () {},
                child: GestureDetector(
                  onTap: () {
                    navigationService.push(UpdateAdminView(
                      admin: admin,
                      customers: model.roleList,
                      onPop: () {
                        model.init();
                      },
                    ));
                  },
                  child: Container(
                    child: UserTile(
                      title: "${admin.firstName} ${admin.lastName}",
                      subtitle: admin.email,
                      status: admin.active ? "Active" : "Inactive",
                    ),
                  ),
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
