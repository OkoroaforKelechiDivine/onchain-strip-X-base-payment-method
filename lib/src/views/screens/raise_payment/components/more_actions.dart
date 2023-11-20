import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/cores.dart';

class BuildMoreActions extends StatelessWidget {
  final String status;
  final VoidCallback onTap;

  const BuildMoreActions({
    required this.status,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    if (status == 'Approved') {
      return Container();
    } else if (status == 'Declined') {
      return const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 200, bottom: 20),
            child: Text(
              "Reason:",
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.bold,
                fontSize: AppFontSize.size18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, bottom: 20),
            child: Text(
              "blah blah",
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.light,
                fontSize: AppFontSize.size16,
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 240, bottom: 20),
            child: Text(
              "More Actions",
              style: TextStyle(
                color: AppColors.lightBlack,
                fontWeight: AppFontWeight.bold,
                fontSize: AppFontSize.size18,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: _buildActionRow(
              'assets/jpg/reset.jpg',
              'Terminate Transaction',
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      );
    }
  }

  Widget _buildActionRow(String imagePath, String label, IconData icon) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: AppFontSize.size16,
            fontWeight: AppFontWeight.bold,
            color: AppColors.lightBlack,
          ),
        ),
        const Spacer(),
        Icon(icon),
      ],
    );
  }
}
