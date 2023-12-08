import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
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
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white10,
            leading: const BackButton(),
            title: const Text(
              "Inflow",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(23, 171, 144, 1),
              ),
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
              return ListView.separated(
                itemBuilder: (context, index) {
                  final bank = model.inflowList[index];
                  return Container(
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
                        "Inflow",
                        style: TextStyle(
                          fontFamily: GoogleFonts.alegreyaSans().fontFamily,
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
                            "${formatBalance(bank.amount.toDouble())}}",
                            style: const TextStyle(
                              color: AppColors.lightGreen,
                              fontWeight: AppFontWeight.bold,
                              fontSize: AppFontSize.size14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: model.inflowList.length,
              );
            },
          ),
        );
      },
    );
  }
}
