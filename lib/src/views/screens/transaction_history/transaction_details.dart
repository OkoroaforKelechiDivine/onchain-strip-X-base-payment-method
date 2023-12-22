import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_response.dart';
import 'package:pay_me_mobile/src/views/screens/raise_payment/components/info_row.dart';
import 'package:pay_me_mobile/src/views/screens/report_transaction/report_transaction_screen.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/components/transaction_type_design.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/repeat_transaction.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_history/transaction_detail_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../app_config/manager/font_manager.dart';
import '../../../../data/model/params/create_ticket_param.dart';
import '../../../custom/custom_bottom_bar_navigation.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final TransactionResponse transactionResponse;

  const TransactionDetailsScreen({
    Key? key,
    required this.transactionResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedTimestamp = DateFormat('MMMM dd, yyyy \'at\' hh:mm a')
        .format(transactionResponse.timeStamp ?? DateTime.now());
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TransactionDetailViewModel(),
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: AppFontSize.size20,
                        color: AppColors.lightGreen,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "₦${formatBalance(transactionResponse.amount!.toDouble())}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: AppFontWeight.bold,
                        color: AppColors.lightBlack,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'On $formattedTimestamp',
                    style: const TextStyle(
                      fontSize: AppFontSize.size16,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.lightBlack,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Builder(
                        builder: (context) {
                          if (transactionResponse.transactionType ==
                              "Outflow") {
                            return OutflowReceipt(
                              transactionResponse: transactionResponse,
                            );
                          }
                          if (transactionResponse.transactionType ==
                              "Airtime") {
                            return AirtimeRecept(
                              transactionResponse: transactionResponse,
                            );
                          }
                          if (transactionResponse.transactionType == "Power") {
                            return PowerRecept(
                              transactionResponse: transactionResponse,
                            );
                          }
                          if (transactionResponse.transactionType == "Inflow") {
                            return InflowRecept(
                              transactionResponse: transactionResponse,
                            );
                          }
                          return TvCableRecept(
                            transactionResponse: transactionResponse,
                          );
                        },
                      ),
                      const SizedBox(height: 15),
                      AppCustomButton(
                        onPressed: () {
                          navigationService.push(
                            ReportTransactionScreen(
                              transactionId:
                                  transactionResponse.transactionId ?? '',
                            ),
                          );
                        },
                        title: 'Report Transaction',
                        color: AppColors.lightGreen,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // bottomNavigationBar: CustomBottomNavigationBar(
          //   currentIndex: _currentIndex,
          //   onTap: (int index) {
          //     setState(() {
          //       _currentIndex = index;
          //     });
          //   },
          // ),
        );
      },
    );
  }

  void _showHelloDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: AppColors.deepWhite,
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: Column(
                children: [
                  Text(
                    'Share Receipt',
                    style: TextStyle(
                        fontSize: AppFontSize.size20,
                        fontWeight: AppFontWeight.bold,
                        color: AppColors.lightBlack),
                  ),
                  SizedBox(height: 40),
                  Text("PDF",
                      style: TextStyle(
                          fontSize: AppFontSize.size16,
                          fontWeight: AppFontWeight.bold,
                          color: AppColors.lightBlack)),
                  SizedBox(height: 40),
                  Text("Image",
                      style: TextStyle(
                          fontSize: AppFontSize.size16,
                          fontWeight: AppFontWeight.bold,
                          color: AppColors.lightBlack)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDivider() {
    return Container(
      color: AppColors.lightGreen,
      height: 0.5,
    );
  }
}
