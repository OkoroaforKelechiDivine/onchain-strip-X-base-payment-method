import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/beneficiary/components/account_button.dart';

import 'edit_beneficiary.dart';

class BuildActionButton extends StatelessWidget {
  const BuildActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        BuildEditBeneficiaryButton(),
        SizedBox(width: 60),
        BuildAddAccountButton(),
      ],
    );
  }
}
