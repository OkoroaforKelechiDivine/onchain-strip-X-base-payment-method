import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/account_number.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/account_number_error.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/next_button.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/components/username_text.dart';

import '../../../../../../app_config/manager/font_manager.dart';
import '../../../../../../core/constants/colors.dart';

class BuildRecipientCard extends StatefulWidget {
  final BuildContext context;

  const BuildRecipientCard({super.key, required this.context});

  @override
  State<BuildRecipientCard> createState() => _BuildRecipientCardState();
}

class _BuildRecipientCardState extends State<BuildRecipientCard> {
  final String _selectedBankLogo = '';
  final TextEditingController _selectedBankController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bankLogoAsset = _selectedBankLogo.isEmpty ? null : _selectedBankLogo.startsWith("data:image") ? _selectedBankLogo.split(',')[1] : _selectedBankLogo;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          color: AppColors.pureWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Recipient Account',
                    style: TextStyle(
                      color: AppColors.lightBlack,
                      fontWeight: AppFontWeight.bold,
                      fontSize: AppFontSize.size14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.lightGrey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      bankLogoAsset != null ? Image.memory(base64Decode(bankLogoAsset), width: 30, height: 30) : Container(),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _selectedBankController.text,
                                style: const TextStyle(
                                  color: AppColors.lightBlack,
                                  fontWeight: AppFontWeight.bold,
                                  fontSize: AppFontSize.size14,
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: AppFontSize.size18,
                                color: AppColors.lightBlack,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const BuildAccountNumberTextField(),
                const BuildAccountNumberErrorMessage(),
                const BuildUsernameText(),
                const SizedBox(height: 2),
                const BuildNextTextButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
