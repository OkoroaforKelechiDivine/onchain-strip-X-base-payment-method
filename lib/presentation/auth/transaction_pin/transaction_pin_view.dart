import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/presentation/auth/transaction_pin/transaction_pin_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class TransactionPinView extends StatelessWidget {
  final Function(bool val) onPinComplete;
  final String title;
  const TransactionPinView(
      {super.key, required this.onPinComplete, required this.title});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TransactionPinViewModel(),
      builder: (context, model, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: index < model.pin.length
                        ? Colors.black
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  if (index == 9) {
                    return GestureDetector(
                      onTap: () {
                        // Implement fingerprint authentication logic here
                      },
                      child: const Icon(
                        Icons.fingerprint,
                        size: 32,
                      ),
                    );
                  } else if (index == 10) {
                    return GestureDetector(
                      onTap: () async {
                        model.addDigit('0');
                        if (model.pin.length == 4) {
                          final res = await model.confirmPin();
                          onPinComplete(res);
                          //onComplete(res);
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.pinBg,
                        child: AppText(
                          '0',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    );
                  } else if (index == 11) {
                    return GestureDetector(
                      onTap: model.removeDigit,
                      child: const Icon(Icons.backspace),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () async {
                        model.addDigit('${index + 1}');
                        if (model.pin.length == 4) {
                          final res = await model.confirmPin();
                          onPinComplete(res);
                          //onComplete(res);
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.pinBg,
                        child: AppText(
                          '${index + 1}',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }
}
