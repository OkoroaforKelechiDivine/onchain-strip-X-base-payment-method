import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/component/role_time.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/create_roles/create_role.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/user_mangement_view_model.dart';

import '../../../../../core/di/locator.dart';

class RolesTab extends StatelessWidget {
  final UserManagementHomeVM model;
  const RolesTab({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Builder(
        builder: (context) {
          if (model.isLoadingRoles) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
          if (model.roleList.isEmpty) {
            return const Center(
                child: AppText("No Role found. Create New Role"));
          }
          return ListView.separated(
            itemCount: model.roleList.length,
            //hrinkWrap: true,
            itemBuilder: (context, index) {
              final role = model.roleList[index];
              return GestureDetector(
                onTap: () {
                  navigationService.push(
                    CreateRoleView(
                      role: role,
                      onPop: () {
                        model.init();
                      },
                    ),
                  );
                },
                child: RoleTile(
                  title: role.label,
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
