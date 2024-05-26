import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/constants/app_assets.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/bank_response.dart';
import 'package:pay_me_mobile/presentation/transfer/transfer_viewmodel.dart';
import '../../../../core/cores.dart';

class BankList extends StatelessWidget {
  final bool isLoading;
  final List<BankResponse>? bankList;
  final TransferViewModel model;
  const BankList({
    super.key,
    required this.isLoading,
    required this.bankList,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await model.getBankList();
        },
        child: Column(
          children: [
            SizedBox(height: 25.h),
            const PaymeAppBar(
              isBack: true,
              title: "Transfer",
            ),
            isLoading
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : bankList == null
                    ? const AppText("Unable to Fetch Banks. Please Reload")
                    : Expanded(
                        child: Column(
                          children: [
                            //const SizedBox(height: 20),
                            AppCustomTextField(
                              hintText: 'Search Bank',
                              focusBorderColor: AppColors.white,
                              backgroundColor: AppColors.white,
                              borderColor: AppColors.darkWhite,
                              prefixIcon: const Icon(CupertinoIcons.search),
                              containerPadding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              padding: const EdgeInsets.all(12),
                              onChanged: (value) {
                                model.onSearchBank(value);
                              },
                              textEditingController: model.searchController,
                            ),

                            const SizedBox(height: 20),
                            Expanded(
                              child: MediaQuery.removePadding(
                                removeTop: true,
                                context: context,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: model.filteredBanks.length,
                                  itemBuilder: (context, index) {
                                    final bank = model.filteredBanks[index];
                                    return ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 4,
                                      ),
                                      leading:
                                          SvgPicture.asset(AppAssets.bankIcon),
                                      title: AppText(
                                        bank.name,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      onTap: () {
                                        model.onSelectBank(bank);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
