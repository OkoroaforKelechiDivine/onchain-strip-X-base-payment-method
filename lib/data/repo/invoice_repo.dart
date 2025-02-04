import 'package:pay_me_mobile/data/datasources/remote/base/api_response.dart';
import 'package:pay_me_mobile/data/datasources/remote/invoice_api.dart';
import 'package:pay_me_mobile/data/model/params/create_customer_param.dart';
import 'package:pay_me_mobile/data/model/params/create_invoice_param.dart';
import 'package:pay_me_mobile/data/model/response/invoice/create_invoice_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_all_invoice_list_response.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_customer_res.dart';
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

  Future<ApiResponse<List<GetInvoiceListRes>>> getAllInvoice() async {
    return _invoiceApi.getAllInvoice();
  }

  Future<ApiResponse<List<GetCustomerRes>>> getAllCustomer() async {
    return _invoiceApi.getAllCustomer();
  }

  Future<ApiResponse<String>> deleteInvoice({required String id}) async {
    return _invoiceApi.deleteInvoice(id: id);
  }
}
