import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/card.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/transaction_list.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/transaction_history_viewmodel.dart';
import 'package:stacked/stacked.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TransactionHistoryViewModel(),
      //onModelReady: (viewModel) => viewModel.init(),
      onViewModelReady: (viewModel) async {
        await viewModel.init();
      },
      builder: (context, model, child) {
        return RefreshIndicator(
          onRefresh: () async {
            await model.init();
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              title: Text(
                'Transaction History',
                style: sans(color: AppColors.lightGreen),
              ),
            ),
            body: Builder(
              builder: (context) {
                if (model.isLoadingTransaction) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.lightGreen,
                    ),
                  );
                }
                if (model.isTransactionError) {
                  return Center(
                    child: Text(
                      "An error occured while fetching transactions",
                      style: sans(color: AppColors.lightGreen),
                    ),
                  );
                }
                if (model.transactionList.isEmpty) {
                  return Center(
                    child: Text(
                      "No Transaction Found",
                      style: sans(color: AppColors.lightGreen),
                    ),
                  );
                }
                return BuildTransactionList(
                  model: model,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
