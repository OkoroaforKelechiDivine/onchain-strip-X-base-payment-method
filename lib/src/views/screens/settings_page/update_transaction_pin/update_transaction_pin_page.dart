import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/update_transaction_pin/update_transaction_pin_view_model.dart';
import 'package:stacked/stacked.dart';

class UpdateTransactionPinPage extends StatelessWidget {
  const UpdateTransactionPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => UpdateTransactionPinVM(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Update Transaction Pin'),
          ),
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
