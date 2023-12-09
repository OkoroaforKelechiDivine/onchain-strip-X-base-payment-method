import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/set_transaction_pin/set_transaction_vm.dart';
import 'package:stacked/stacked.dart';

class SetTransactionPinPage extends StatelessWidget {
  const SetTransactionPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SetTransactionPinVM(),
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          ),
        );
      },
    );
  }
}
