import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/widgets/app_text.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/core/utilities/file_util.dart';
import 'package:pay_me_mobile/src/views/screens/transactions/transfer/transfer_viewmmodel.dart';

import '../../../../../core/cores.dart';

class BankList extends StatelessWidget {
  final Function() onBack;
  final Function(BankResponse bank) onSelectBank;
  final bool isLoading;
  final List<BankResponse>? bankList;
  final TransferViewModel model;
  const BankList(
      {super.key,
      required this.onBack,
      required this.onSelectBank,
      required this.isLoading,
      required this.bankList,
      required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await model.getBankList();
        },
        child: Container(
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
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()))
                  : bankList == null
                      ? const AppText("Unable to Fetch Banks. Please Reload")
                      : Expanded(
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              AppCustomTextField(
                                textEditingController: model.searchController,
                                prefixIcon: const Icon(CupertinoIcons.search),
                                hintText: 'Search Bank',
                                onChanged: (value) {
                                  model.onSearchBank(value);
                                },
                              ),
                              //const SizedBox(height: 20),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: model.filteredBanks.length,
                                  itemBuilder: (context, index) {
                                    final bank = model.filteredBanks[index];
                                    return ListTile(
                                      //I want a circularavatar here
                                      leading: bank.logo.isNotEmpty
                                          ? const CircleAvatar(
                                              child: Icon(Icons.food_bank),
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
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
// CircleAvatar(
//                                                 backgroundImage: MemoryImage(
//                                                   processImage(bank.logo),
//                                                 ),
//                                               )