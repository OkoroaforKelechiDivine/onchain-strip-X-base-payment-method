import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/transaction_response/transaction_response.dart';
import 'package:pdf/pdf.dart';
import 'package:stacked/stacked.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class TransactionDetailViewModel extends BaseViewModel {
  void onReport(Widget child) {
    bottomSheetService.show(child);
    notifyListeners();
  }

  Future<void> createPdfAndSave(TransactionResponse transactionResponse) async {
    final pdf = pw.Document();
    final imageProvider =
        await _fetchImageProvider(); // Function to fetch your logo image

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Image(imageProvider, width: 150),
                ],
              ),

              pw.SizedBox(height: 20),
              pw.Text('Online Banking',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 8),
              pw.Text('Transaction Receipt',
                  style: const pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 20),
              _buildPdfReceiptContent(
                  transactionResponse), // Dynamic content based on transaction type
              pw.SizedBox(height: 8),
              pw.Text(
                  '''This is an electronic receipt of a transaction and does not require any signature.
The authenticity of transaction can be confirmed with the Bank.
For any other assistance, kindly call True Serve on 08104581100 or email request@systemshift.africa''',
                  style: const pw.TextStyle(fontSize: 16)),
            ],
          );
        },
      ),
    );

    // Save the document
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/receipt.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());

    // Share the document
    Share.shareFiles([path], text: 'Your Transaction Receipt');
  }

  pw.Widget _buildPdfReceiptContent(TransactionResponse transactionResponse) {
    switch (transactionResponse.transactionType) {
      case "Airtime":
        return _buildAirtimeReceipt(transactionResponse);
      case "Power":
        return _buildPowerReceipt(transactionResponse);
      case "Outflow":
        return _buildOutflowReceipt(transactionResponse);
      case "Inflow":
        return _buildInflowReceipt(transactionResponse);
      // Add other cases as needed
      default:
        return _buildTvCableReceipt(transactionResponse);
    }
  }

// Function for Airtime Receipt
  pw.Widget _buildAirtimeReceipt(TransactionResponse transactionResponse) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildInfoRowPdf(
            'Transaction Type', transactionResponse.transactionType!),
        spacer(),
        _buildInfoRowPdf('Outward Transfer',
            "NGN ${formatBalance(transactionResponse.amount!.toDouble())}"),
        spacer(),
        _buildInfoRowPdf('Status', transactionResponse.statusDescription!),
        spacer(),
        _buildInfoRowPdf('Transaction Id', transactionResponse.transactionId!),
        spacer(),
      ],
    );
  }

// Function for Power Receipt
  pw.Widget _buildPowerReceipt(TransactionResponse transactionResponse) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildInfoRowPdf(
            'Transaction Type', transactionResponse.transactionType!),
        spacer(),
        _buildInfoRowPdf('Outward Transfer',
            "NGN ${formatBalance(transactionResponse.amount!.toDouble())}"),
        spacer(),
        _buildInfoRowPdf('Token', transactionResponse.purchaseCode ?? ""),
        spacer(),
        _buildInfoRowPdf('Status', transactionResponse.statusDescription!),
        spacer(),
        _buildInfoRowPdf('Transaction Id', transactionResponse.transactionId!),
        spacer(),
      ],
    );
  }

// Function for TV Cable Receipt
  pw.Widget _buildTvCableReceipt(TransactionResponse transactionResponse) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildInfoRowPdf(
            'Transaction Type', transactionResponse.transactionType!),
        spacer(),
        _buildInfoRowPdf('Outward Transfer',
            "NGN ${formatBalance(transactionResponse.amount!.toDouble())}"),
        spacer(),
        _buildInfoRowPdf('Status', transactionResponse.statusDescription!),
        spacer(),
        _buildInfoRowPdf('Transaction Id', transactionResponse.transactionId!),
        spacer(),
      ],
    );
  }

// Function for Inflow Receipt
  pw.Widget _buildInflowReceipt(TransactionResponse transactionResponse) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildInfoRowPdf(
            'Account Name', transactionResponse.originatorAccountName!),
        spacer(),
        _buildInfoRowPdf('From', transactionResponse.originatorBank!),
        spacer(),
        _buildInfoRowPdf('Sender Account Number',
            transactionResponse.originatorAccountNumber!),
        spacer(),
        _buildInfoRowPdf(
            'Transaction Type', transactionResponse.transactionType!),
        spacer(),
        _buildInfoRowPdf(
            'Narration', transactionResponse.transactionNarration!),
        spacer(),
        _buildInfoRowPdf('Inflow Transfer',
            "NGN ${formatBalance(transactionResponse.amount!.toDouble())}"),
        spacer(),
        _buildInfoRowPdf('Status', transactionResponse.statusDescription!),
        spacer(),
        _buildInfoRowPdf('Transaction Id', transactionResponse.transactionId!),
        spacer(),
      ],
    );
  }

// Function for Outflow Receipt
  pw.Widget _buildOutflowReceipt(TransactionResponse transactionResponse) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildInfoRowPdf(
            'Account Name', transactionResponse.beneficiaryAccountName!),
        spacer(),
        _buildInfoRowPdf('To', transactionResponse.beneficiaryAccountNumber!),
        spacer(),
        _buildInfoRowPdf(
            'Beneficiary Bank', transactionResponse.beneficiaryBank!),
        spacer(),
        _buildInfoRowPdf(
            'Transaction Type', transactionResponse.transactionType!),
        spacer(),
        _buildInfoRowPdf(
            'Description', transactionResponse.transactionNarration!),
        spacer(),
        _buildInfoRowPdf('Outward Transfer',
            "NGN ${formatBalance(transactionResponse.amount!.toDouble())}"),
        spacer(),
        _buildInfoRowPdf('Status', transactionResponse.statusDescription!),
        spacer(),
        _buildInfoRowPdf('Transaction Id', transactionResponse.transactionId!),
        spacer(),
      ],
    );
  }

// Similarly create _buildPowerReceipt and other methods for different transaction types

  pw.Widget _buildInfoRowPdf(String label, String value) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text("$label:",
            style:
                pw.TextStyle(fontWeight: pw.FontWeight.normal, fontSize: 14)),
        pw.SizedBox(height: 8),
        pw.Text(value,
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  pw.Widget spacer() {
    return pw.Column(
      children: [
        pw.SizedBox(height: 8),
        pw.Divider(
          color: PdfColor.fromHex("#2B606E"),
          height: 0.5,
        ),
        pw.SizedBox(height: 8),
      ],
    );
  }

  Future<pw.ImageProvider> _fetchImageProvider() async {
    // Fetch your logo image from assets or network
    // For example, to load an image from assets:
    return pw.MemoryImage(
        (await rootBundle.load("assets/png/payme.png")).buffer.asUint8List());
  }

  pw.Widget buildDivider() {
    return pw.Container(
      color: PdfColor.fromHex("#2B606E"),
      height: 0.5,
    );
  }
}
