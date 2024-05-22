import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';
import '../transfer_viewmodel.dart';

class SelectBankView extends StatelessWidget {
  const SelectBankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TransferViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const PaymeAppBar(
            isBack: true,
            title: "Choose Bank",
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                AppCustomTextField(
                  focusBorderColor: AppColors.grey,
                  hintText: "Search Bank",
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.transparentDeep,
                  textEditingController: model.searchController,
                  textInputType: TextInputType.text,
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      model.clearSearch();
                    },
                  ),
                  onChanged: model.filterBanks,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.filteredBanks.length,
                    itemBuilder: (context, index) {
                      final bank = model.filteredBanks[index];
                      return ListTile(
                        leading: Image.asset(bank['logo']!),
                        title: Text(bank['name']!),
                        onTap: () {
                          Navigator.pop(context, bank);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
