import 'package:flutter/material.dart';
import 'package:pay_me_mobile/presentation/invoice/invoice_home_viewmodel.dart';
import 'package:pay_me_mobile/presentation/invoice/tabs/invoice_tab.dart';
import 'package:stacked/stacked.dart';

import '../../core/cores.dart';

class InvoiceHomeScreen extends StatelessWidget {
  const InvoiceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => InvoiceHomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return RefreshIndicator(
          key: model.refreshKey,
          onRefresh: () async {
            //await model.init();
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
              backgroundColor: AppColors.scaffoldBg,
              body: Column(
                children: [
                  const SizedBox(height: 16),
                  const PaymeAppBar(
                    isBack: true,
                    title: "Invoice",
                  ),
                  const SizedBox(height: 18),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'Invoices',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                  //const SizedBox(height: 24),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 24),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 22),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Expanded(child: InvoiceTab(model: model)),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 36,
                          right: 26,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: model.showFullButton
                                ? FloatingActionButton.extended(
                                    elevation: 0,
                                    key: const ValueKey('full'),

                                    onPressed: () {},
                                    backgroundColor: AppColors.lightBlueButton,
                                    label: const AppText(
                                      'Add  +',
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                    //icon: Icon(Icons.add),
                                  )
                                : FloatingActionButton(
                                    elevation: 0,
                                    key: const ValueKey('icon'),
                                    onPressed: () {},
                                    backgroundColor: AppColors.lightBlueButton,
                                    child: const AppText(
                                      '+',
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
