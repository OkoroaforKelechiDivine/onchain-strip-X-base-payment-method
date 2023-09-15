import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/screens/transfer_to_bank/transfer_to_bank_screen.dart';

import '../../app_config/manager/font_manager.dart';
import '../../app_config/manager/theme_manager.dart';

class BeneficiaryDetailPage extends StatelessWidget {
  final Color circleColor;
  final String logo;
  final String accountNumber;
  final String accountName;

  BeneficiaryDetailPage({
    required this.circleColor,
    required this.accountName,
    required this.logo,
    required this.accountNumber
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0),
          child: Text(
            'Beneficiary',
            style: TextStyle(
              fontSize: AppFontSize.size20,
              color: AppColors.lightGreen,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
              ),
              child: Center(
                child: Text(
                  accountName.isNotEmpty ? accountName[0].toUpperCase() : '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.size20,
                    color: AppColors.pureWhite,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              accountName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.size20,
                color: AppColors.lightBlack,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Card(
                  color: AppColors.lightGreen,
                  child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                              Icons.edit,
                              color: AppColors.pureWhite
                          ),
                          // SizedBox(width: 8),
                          Text("Edit Beneficiary",
                              style: TextStyle(
                                  fontWeight: AppFontWeight.bold,
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 60),
              Card(
                color: AppColors.lightGreen,
                child: InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                            Icons.add,
                            color: AppColors.pureWhite
                        ),
                        // SizedBox(width: 8),
                        Text("Add Account",
                          style: TextStyle(
                              fontWeight: AppFontWeight.bold
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              color: AppColors.pureWhite,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("NGN Accounts", style: TextStyle(color: AppColors.lightBlack, fontWeight: AppFontWeight.bold),),
                )),
          )
        ],
      ),
    );
  }
}
