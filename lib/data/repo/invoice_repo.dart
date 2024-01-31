import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/invoice_api.dart';
import 'package:pay_me_mobile/data/model/params/create_customer_param.dart';
import 'package:pay_me_mobile/data/model/params/create_invoice_param.dart';
import 'package:pay_me_mobile/data/model/response/invoice/create_invoice_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/single_customer_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/single_invoice_response.dart';

class InvoiceRepo {
  final _invoiceApi = InvoiceApi();

  Future<ApiResponse<CreateCustomerResponse>> createCustomer(
      {required CreateCustomerParam param}) async {
    return _invoiceApi.createCustomer(param: param);
  }

  Future<ApiResponse<String>> createInvoice(
      {required CreateInvoiceParam param}) async {
    return _invoiceApi.createInvoice(param: param);
  }

  Future<ApiResponse<SingleInvoiceResponse>> getSingleInvoice(
      {required int id}) async {
    return _invoiceApi.getSingleInvoice(id: id);
  }

  Future<ApiResponse<SingleCustomerResponse>> getSingleCustomer(
      {required int id}) async {
    return _invoiceApi.getSingleCustomer(id: id);
  }
}
