import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/user_management/create_roles/create_role_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CreateRoleView extends StatelessWidget {
  final Function()? onPop;
  const CreateRoleView({super.key, this.onPop});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CreateRolesViewModel(),
      builder: (context, model, child) {
        return const Placeholder();
      },
    );
  }
}
