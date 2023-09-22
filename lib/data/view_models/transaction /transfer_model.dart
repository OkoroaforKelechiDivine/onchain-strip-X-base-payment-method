import 'package:flutter/cupertino.dart';
import 'package:pay_me_mobile/data/data_provider/transfer_data_provider.dart';
import 'package:pay_me_mobile/data/states/transaction%20/transfer_state.dart';
import '../../../locator.dart';
import '../../constants/enum/view_state.dart';
import '../../utilities/secure_storage/secure_storage_utils.dart';

class TransferModel extends TransferState {
  final TransferDataProvider _transferDataProvider = locator<TransferDataProvider>();
  String? _message;

  String? get message => _message;

  fetchBankList(BuildContext context) async {
    setState(ViewState.Retrieved);
    try {
      final response = await _transferDataProvider.fetchBankList(context);
      SecureStorageUtils.saveToken(token: response.token ?? "null");
      setState(ViewState.Retrieved);
    } catch (e) {
      _message = "NO BANK WAS FOUND";
      setState(ViewState.Error);
    }
  }

  fetchBillerList(BuildContext context) async {
    try {
      final List<Biller> billers = await _transferDataProvider.fetchAllBillers(context);
      for (Biller biller in billers) {
        print("Biller ID: ${biller.id}");
        print("Biller Name: ${biller.name}");
      }
      setState(ViewState.Retrieved);
    } catch (e) {
      _message = "An error occurred: $e";
      setState(ViewState.Error);
    }
  }

  fetchBillerItems(BuildContext context, String billerId, String divisionId, String productId) async {
    try {
      final List<Map<String, dynamic>> billerItems = await _transferDataProvider.fetchBillerItems(
        context,
        billerId,
        divisionId,
        productId,
      );

      for (Map<String, dynamic> item in billerItems) {
        print("Payment Item ID: ${item['id']}");
        print("Payment Item Name: ${item['paymentItemName']}");
      }
      setState(ViewState.Retrieved);
    } catch (e) {
      _message = "An error occurred: $e";
      setState(ViewState.Error);
    }
  }

}
