import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/inflow_response.dart';
import 'package:pay_me_mobile/src/views/screens/inflow/inflow_details.dart';
import 'package:pay_me_mobile/src/views/screens/inflow/inflow_viewmodel.dart';
import 'package:stacked/stacked.dart';

class InflowScreen extends StatelessWidget {
  const InflowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => InflowViewmodel(),
      builder: (context, model, child) {
        return RefreshIndicator(
          key: model.refreshKey,
          onRefresh: () async {
            await model.init();
          },
          child: GestureDetector(
            onVerticalDragStart: (dragDetails) {
              model.startVerticalDragDetailsY = dragDetails.globalPosition.dy;
            },
            onVerticalDragUpdate: (dragDetails) {
              model.updateVerticalDragDetailsY = dragDetails.globalPosition.dy;
            },
            onVerticalDragEnd: (endDetails) {
              if (model.startVerticalDragDetailsY <
                  model.updateVerticalDragDetailsY) {
                // User dragged down
                model.refreshKey.currentState?.show();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: const BackButton(),
                title: Text(
                  "Inflow",
                  style: sans(color: AppColors.lightGreen),
                ),
              ),
              body: Builder(
                builder: (context) {
                  if (model.isProcessing) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (model.inflowList.isEmpty) {
                    return const Center(
                      child: Text('No inflow yet'),
                    );
                  }
                  return GroupedListView<InflowResponse, String>(
                    //reverse: true,
                    elements: model.inflowList,
                    groupBy: (element) {
                      final DateTime date =
                          DateTime.parse(element.timeStamp).toLocal();
                      return DateFormat('yyyy-MM-dd').format(date);
                    },
                    groupSeparatorBuilder: (String value) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Container(
                          color: AppColors.deepWhite,
                          height: 20,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              DateFormat('dd MMMM, yyyy')
                                  .format(DateTime.parse(value)),
                              style: const TextStyle(
                                fontWeight: AppFontWeight.bold,
                                fontSize: AppFontSize.size12,
                                color: AppColors.lightBlack,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    order: GroupedListOrder.DESC,
                    itemComparator: (item1, item2) {
                      final DateTime item1Date =
                          DateTime.parse(item1.timeStamp).toLocal();
                      final DateTime item2Date =
                          DateTime.parse(item2.timeStamp).toLocal();
                      return item2Date.compareTo(item1Date);
                    },
                    indexedItemBuilder: (context, element, index) {
                      final bank = element;
                      return GestureDetector(
                        onTap: () {
                          bottomSheetService
                              .show(InflowDetails(transactionResponse: bank));
                          //navigationService.push();
                        },
                        child: Container(
                          color: AppColors.lightBlue,
                          child: ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.lightGreen,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.money,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              bank.originatorAccountName,
                              style: TextStyle(
                                fontFamily:
                                    GoogleFonts.alegreyaSans().fontFamily,
                                fontWeight: AppFontWeight.bold,
                                fontSize: AppFontSize.size14,
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  model.formatTimestamp(
                                      DateTime.tryParse(bank.timeStamp) ??
                                          DateTime.now()),
                                  style: const TextStyle(
                                    color: AppColors.lightBlack,
                                    fontWeight: AppFontWeight.light,
                                    fontSize: AppFontSize.size14,
                                  ),
                                ),
                                Text(
                                  "₦${formatBalance(bank.amount.toDouble())}",
                                  style: const TextStyle(
                                    color: AppColors.lightGreen,
                                    fontWeight: AppFontWeight.bold,
                                    fontSize: AppFontSize.size14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}




        // ListView.separated(
        //         itemBuilder: (context, index) {
        //           final bank = model.inflowList[index];
        //           return Container(
        //             color: AppColors.lightBlue,
        //             child: ListTile(
        //               leading: Container(
        //                 padding: const EdgeInsets.all(10),
        //                 decoration: BoxDecoration(
        //                   color: AppColors.lightGreen,
        //                   borderRadius: BorderRadius.circular(100),
        //                 ),
        //                 child: const Icon(
        //                   Icons.money,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //               title: Text(
        //                 bank.originatorAccountName,
        //                 style: TextStyle(
        //                   fontFamily: GoogleFonts.alegreyaSans().fontFamily,
        //                   fontWeight: AppFontWeight.bold,
        //                   fontSize: AppFontSize.size14,
        //                 ),
        //               ),
        //               subtitle: Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(
        //                     model.formatTimestamp(
        //                         DateTime.tryParse(bank.timeStamp) ??
        //                             DateTime.now()),
        //                     style: const TextStyle(
        //                       color: AppColors.lightBlack,
        //                       fontWeight: AppFontWeight.light,
        //                       fontSize: AppFontSize.size14,
        //                     ),
        //                   ),
        //                   Text(
        //                     "#${formatBalance(bank.amount.toDouble())}",
        //                     style: const TextStyle(
        //                       color: AppColors.lightGreen,
        //                       fontWeight: AppFontWeight.bold,
        //                       fontSize: AppFontSize.size14,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           );
        //         },
        //         separatorBuilder: (context, index) =>
        //             const SizedBox(height: 10),
        //         itemCount: model.inflowList.length,
        //       );