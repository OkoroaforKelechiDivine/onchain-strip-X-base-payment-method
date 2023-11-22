import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/data/utilities/file_util.dart';

class BankList extends StatelessWidget {
  final Function() onBack;
  final Function(BankResponse bank) onSelectBank;
  final bool isLoading;
  final List<BankResponse>? bankList;
  const BankList(
      {super.key,
      required this.onBack,
      required this.onSelectBank,
      required this.isLoading,
      required this.bankList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        onBack();
                      },
                      child: const Icon(Icons.arrow_back_ios)),
                  const Spacer(),
                  const AppText(
                    'Select Bank',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                ],
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : bankList == null
                      ? const AppText("Unable to Fetch Banks. Please Reload")
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bankList!.length,
                            itemBuilder: (context, index) {
                              final bank = bankList![index];

                              return ListTile(
                                //I want a circularavatar here
                                leading: bank.logo.isNotEmpty
                                    ? CircleAvatar(
                                        backgroundImage: MemoryImage(
                                          processImage(bank.logo),
                                        ),
                                      )
                                    : const CircleAvatar(
                                        child: Icon(Icons.food_bank),
                                      ),
                                title: AppText(bank.name),
                                onTap: () {
                                  onSelectBank(bank);
                                },
                              );
                            },
                          ),
                        ),
            ],
          )),
    );
  }
}
