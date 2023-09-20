
import 'package:flutter/material.dart';

import '../app_config/manager/font_manager.dart';
import '../app_config/manager/theme_manager.dart';
import '../data/constants/enum/view_state.dart';
import '../data/states/auth/login_state.dart';

Widget appButton(BuildContext context,{required void Function()? onPressed,required dynamic loginState}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: ElevatedButton(
      onPressed: onPressed,
      child: loginState.state == ViewState.Busy ?
      CircularProgressIndicator()
          :
      const Text(
        'Sign in',
        style: TextStyle(
          fontSize: AppFontSize.size16,
          color: AppColors.deepWhite,
          fontWeight: AppFontWeight.bold,
        ),
      ),
    ),
  );
}
