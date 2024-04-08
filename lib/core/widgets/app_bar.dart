import 'package:flutter/material.dart';

import '../cores.dart';

class SimplyAssessAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? title;

  const SimplyAssessAppBar({Key? key, this.actions, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          AppText(
            title ?? 'SimplyAccess',
            color: AppColors.lightGreen,
            fontSize: 20,
          ),
        ],
      ),
      actions: actions,
      backgroundColor: AppColors.lightGreen,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
