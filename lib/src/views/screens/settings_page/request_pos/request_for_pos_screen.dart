import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/request_pos/request_for_pos_view_model.dart';
import 'package:stacked/stacked.dart';

class RequestForPOSPage extends StatelessWidget {
  const RequestForPOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RequestForPOSViewModel(),
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
