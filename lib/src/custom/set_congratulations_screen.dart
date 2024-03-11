import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app_config/manager/font_manager.dart';
import '../../core/cores.dart';
class CongratulationsDialog extends StatelessWidget {
  final double amount;
  final String accountName;

  const CongratulationsDialog({Key? key, required this.amount, required this.accountName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30),
                  _buildSuccessImage(),
                  const SizedBox(height: 30),
                  _buildSuccessTitle(),
                  const SizedBox(height: 40),
                  _buildSuccessMessage(),
                  const SizedBox(height: 40),
                  _buildButtonRow(context),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSuccessImage() {
    return Image.asset(
      'assets/jpg/success.jpg',
      width: 48,
      height: 48,
    );
  }

  Widget _buildSuccessTitle() {
    return Text(
      'Transaction Successful',
      style: TextStyle(
        fontSize: AppFontSize.size24,
        fontWeight: AppFontWeight.bold,
        fontFamily: GoogleFonts.alegreyaSans().fontFamily,
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Center(
      child: Column(
        children: [
          Text(
            "Transaction successful, You have\n "
                "successfully sent ₦${amount.toString()}0\n "
                "to $accountName",
            style: TextStyle(
              fontWeight: AppFontWeight.semiBold,
              fontSize: AppFontSize.size18,
              fontFamily: GoogleFonts.alegreyaSans().fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCardButton('Home >', () {
          Navigator.of(context).pushReplacementNamed("/home");
        }, context),
        _buildCardButton('Add Beneficiary >', () {}, context),
      ],
    );
  }

  Widget _buildCardButton(String label, Function onPressed, BuildContext context) {
    return Card(
      color: AppColors.lightBlue,
      elevation: 5,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.lightGreen,
              fontSize: AppFontSize.size18,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
        ),
      ),
    );
  }
}
