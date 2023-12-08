import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/data/model/params/create_ticket_param.dart';
import 'package:pay_me_mobile/src/views/screens/report_transaction/report_transaction_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ReportTransactionScreen extends StatelessWidget {
  final String transactionId;
  const ReportTransactionScreen({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ReportTransactionViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white10,
            title: Text(
              'Transaction',
              style: sans(
                color: AppColors.lightGreen,
                fontSize: AppFontSize.size20,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                AppCustomTextField(
                  textEditingController: model.titleController,
                  hintText: 'Title',
                  labelText: 'Title',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                AppCustomTextField(
                  textEditingController: model.descriptionController,
                  hintText: 'Description',
                  labelText: 'Description',
                  onChanged: (value) {},
                  maxLines: 9,
                  minLines: 7,
                ),
                const SizedBox(height: 20),
                AppCustomButton(
                  title: 'Report',
                  loading: model.isReporting,
                  onPressed: () {
                    final param = CreateTicketParam(
                      transactionId: transactionId,
                      title: model.titleController.text,
                      content: model.descriptionController.text,
                    );
                    model.reportTransaction(param);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
