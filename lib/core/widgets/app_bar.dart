import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';

import '../cores.dart';

class PaymeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? title;
  final bool isBack;

  const PaymeAppBar({Key? key, this.actions, this.title, required this.isBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isBack)
            GestureDetector(
              onTap: () {
                navigationService.pop();
              },
              child: SvgPicture.asset(AppAssets.back),
            ),
          if (!isBack)
            const SizedBox(
              height: 32,
              width: 32,
            ),
          const Spacer(),
          AppText(
            title ?? '',
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          const SizedBox(
            height: 32,
            width: 32,
          )
        ],
      ),
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
