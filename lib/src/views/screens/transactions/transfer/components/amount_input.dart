import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/send_money_viewmodel.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../custom/custom_dynamic_label_textfield.dart';

class BuildAmountInput extends StatelessWidget {
  final SendMoneyViewModel model;
  const BuildAmountInput({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: AppColors.deepWhite,
            child: TextFieldWithDynamicLabel(
              controller: model.amountController,
              labelText: '₦ 0.00',
              onChanged: (value) {
                //amountErrorHandling();
              },
              onValidation: (value) {},
              hintText: '',
              fillColor: AppColors.deepWhite,
            ),
          ),
        ),
      ],
    );
  }
}
