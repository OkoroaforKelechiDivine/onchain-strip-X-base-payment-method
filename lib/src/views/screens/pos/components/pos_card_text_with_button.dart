import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../total_transaction.dart';

class BuildPosCardTextWithButton extends StatelessWidget {
  final String text;
  const BuildPosCardTextWithButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Card(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TotalTransactionScreen()),
            );
          },
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.lightBlack,
            ),
          ),
        ),
      ),
    );
  }
}
