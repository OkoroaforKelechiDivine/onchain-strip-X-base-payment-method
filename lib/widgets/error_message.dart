
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../app_config/manager/font_manager.dart';
import '../app_config/manager/theme_manager.dart';
import '../data/constants/enum/view_state.dart';
import '../data/view_models/auth/login_model.dart';

Widget buildErrorMessage(BuildContext context) {
  final model = Provider.of<LoginViewModel>(context);
  if (model.message != null && model.state == ViewState.Error) {
    return Text(
      model.message!,
      style: const TextStyle(
        fontWeight: AppFontWeight.light,
        color: AppColors.errorRed,
      ),
    );
  } else {
    return const SizedBox.shrink();
  }
}
