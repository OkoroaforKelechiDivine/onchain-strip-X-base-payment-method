import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/cores.dart';

class AddMoneyView extends StatelessWidget {
  const AddMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppText(
            'ACCOUNT NUMBER',
            fontSize: 16,
          ),
          const SizedBox(height: 8),
          valueContainer(appGlobals.user?.accountNumber ?? ""),
          const SizedBox(height: 20),
          const AppText(
            'Bank Name',
            fontSize: 16,
          ),
          const SizedBox(height: 8),
          valueContainer("VFD Microfinance Bank"),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

Widget valueContainer(String value) {
  return GestureDetector(
    onTap: () {
      Clipboard.setData(ClipboardData(text: value)).then((_) {
        // Optionally, you can use this block to notify the user that the text has been copied.
        snackbarService.success(message: "$value copied to clipboard");
      });
    },
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            value,
            fontSize: 20,
          ),
          const Icon(
            Icons.copy,
            color: AppColors.lightGreen,
          )
        ],
      ),
    ),
  );
}
