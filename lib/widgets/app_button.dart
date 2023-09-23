
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/custom/process/processing_bar.dart';

import '../app_config/manager/font_manager.dart';
import '../app_config/manager/theme_manager.dart';
import '../data/constants/enum/view_state.dart';

Widget appButton(BuildContext context,{required void Function()? onPressed,required dynamic loginState}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: ElevatedButton(
      onPressed: onPressed,
      child: loginState.state == ViewState.Busy ?
      const CircularProgressIndicator() :
      const Text(
        'Sign in',
        style: TextStyle(
          fontSize: AppFontSize.size18,
          color: AppColors.deepWhite,
          fontWeight: AppFontWeight.bold,
        ),
      ),
    ),
  );
}

void navigateToHome(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/home');
}
