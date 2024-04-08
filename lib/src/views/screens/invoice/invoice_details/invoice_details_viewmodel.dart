import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/invoice/single_invoice_response.dart';
import 'package:pay_me_mobile/src/views/screens/invoice/pdf_preview/pdf_preview_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../../../core/cores.dart';

class InvoiceDetailsViewModel extends BaseViewModel {
  SingleInvoiceResponse? _invoice;
  SingleInvoiceResponse? get invoice => _invoice;
  bool isLoading = false;

  Future<void> getSingleInvoice(int id) async {
    isLoading = true;
    notifyListeners();
    final res = await invoiceRepo.getSingleInvoice(id: id);
    if (res.success) {
      isLoading = false;
      notifyListeners();
      _invoice = res.data!;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
      snackbarService.error(message: res.message!);
    }
  }

  Future<String> generateInvoicePdf() async {
    final pdf = pw.Document();
    final imageProvider = await _fetchImageProvider();
    String issuedDate =
        'Issued Date: ${formartDate(invoice!.createdAt.toString())}';
    String dueDate = 'Due Date: ${formartDate(invoice!.dueDate.toString())}';
    String invoiceNumber = 'Invoice No.: INV-${invoice!.invoiceNumber}';

    final headers = ['Description', 'Quantity', 'Rate', 'Total'];
    final data = invoice!.items
        .map((item) => [
              item.description,
              '${item.quantity}',
              (formatBalance(item.pricePerUnit)),
              (formatBalance(item.amount)),
            ])
        .toList();

    // Calculate totals
    //final subtotal = invoice!.items.fold(0.0, (sum, item) => sum + double.parse(item.amount.toString()));
    final tax = invoice!.tax ?? 0.0;
    final discount = invoice!.discount ?? 0.0;
    final subTotal = invoice!.totalAmount + tax + discount;

    // Custom colors for styling
    const PdfColor customHeaderBackgroundColor =
        PdfColor.fromInt(0xFF053C42); // A shade of blue
    const PdfColor customHeaderTextColor =
        PdfColor.fromInt(0xFFFFFFFF); // White
    const PdfColor customBorderColor =
        PdfColor.fromInt(0xFFCCCCCC); // Light grey

    const PdfColor greyTextColor = PdfColor.fromInt(0xFFADBBBB);

    const tableHeaderDecoration =
        pw.BoxDecoration(color: PdfColor.fromInt(0xFF053C42));
    const cellAlignment = pw.Alignment.centerLeft;
    const cellStyle = pw.TextStyle(color: PdfColors.black);
    final cellBorder = pw.Border.all(color: PdfColors.grey, width: 0.5);

    pdf.addPage(pw.MultiPage(
      build: (context) => [
        // Logo and Dates
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
          //pw.Image(imageProvider, width: 150),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
            pw.Text(
              invoiceNumber,
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.Text(issuedDate),
            pw.Text(dueDate),
          ]),
        ]),
        pw.SizedBox(height: 20),
        pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  // mainAxisAlignment: pw.MainAxisAlignment.end,
                  children: [
                    pw.Text('Issued By:',
                        style: pw.TextStyle(
                            fontSize: 16, fontWeight: pw.FontWeight.bold)),
                    pw.Text('${appGlobals.user!.business}',
                        style: const pw.TextStyle(fontSize: 14)),
                  ]),
            ]),
        pw.SizedBox(height: 20),
        pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Text('Issued To:',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.Text('Customer Name: ${invoice!.customerName}',
                  style: const pw.TextStyle(fontSize: 14)),
              pw.Text('Customer Number: ${invoice!.customerPhone}',
                  style: const pw.TextStyle(fontSize: 14)),
            ]),

        pw.SizedBox(height: 20),

        /// Items Table with Custom Styles
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey, width: 0.5),
          children: [
            pw.TableRow(
              decoration:
                  const pw.BoxDecoration(color: customHeaderBackgroundColor),
              children: headers
                  .map((header) => pw.Container(
                        padding: const pw.EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8), // Adjusted padding for headers
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(header,
                            style: pw.TextStyle(
                                color: customHeaderTextColor,
                                fontWeight: pw.FontWeight.bold)),
                      ))
                  .toList(),
            ),
            ...data.map((row) => pw.TableRow(
                  decoration: pw.BoxDecoration(border: cellBorder),
                  children: row
                      .map((cell) => pw.Container(
                            alignment: cellAlignment,
                            padding: const pw.EdgeInsets.all(4),
                            child: pw.Text(cell.toString(), style: cellStyle),
                          ))
                      .toList(),
                )),
          ],
        ),
        pw.SizedBox(height: 20),

        pw.Text('Note: ${invoice!.additionalNote}',
            style: const pw.TextStyle(fontSize: 16)),

        pw.SizedBox(height: 20),

        // Subtotal, Tax, Discount, and Total
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                    'Subtotal: NGN ${formatBalance(double.parse(subTotal.toStringAsFixed(2)))}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 5),
                pw.Text(
                    'Tax: NGN ${formatBalance(double.parse(tax.toString()))}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 5),
                pw.Text(
                    'Discount: NGN ${formatBalance(double.parse(discount.toString()))}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.SizedBox(height: 10),
                pw.Text(
                    'Total: NGN ${formatBalance(double.parse(invoice!.totalAmount.toStringAsFixed(2)))}',
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 22)),
              ]),
        ),
        pw.SizedBox(height: 20),

        // Account Details
        pw.Container(
          padding: const pw.EdgeInsets.all(16),
          decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(10),
              color: const PdfColor.fromInt(0xFFE6F9F9)),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("Payment should be made to:",
                  style: const pw.TextStyle(
                    fontSize: 16,
                    color: PdfColors.black,
                  )),
              pw.SizedBox(height: 20),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Acc. Name:",
                      style: const pw.TextStyle(
                        fontSize: 16,
                        color: PdfColors.black,
                      )),
                  pw.Text(appGlobals.user!.accountName!,
                      style: const pw.TextStyle(
                        fontSize: 16,
                        color: PdfColors.black,
                      )),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Acc. Number:",
                      style: const pw.TextStyle(
                        fontSize: 16,
                        color: PdfColors.black,
                      )),
                  pw.Text(appGlobals.user!.accountNumber!,
                      style: const pw.TextStyle(
                        fontSize: 16,
                        color: PdfColors.black,
                      )),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Bank Name",
                      style: const pw.TextStyle(
                        fontSize: 16,
                        color: PdfColors.black,
                      )),
                  pw.Text("VFD Bank",
                      style: const pw.TextStyle(
                        fontSize: 16,
                        color: PdfColors.black,
                      )),
                ],
              ),
            ],
          ),
        ),
        pw.SizedBox(height: 30),
        pw.Center(
          child: pw.Text(
            "Powered by PayMe",
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              color: greyTextColor,
            ),
          ),
        )
      ],
    ));
    // Custom function to generate table header
    pw.Widget _buildTableHeader(List<String> headers) {
      return pw.Row(
          children: headers.map((header) {
        return pw.Expanded(
          flex: header == 'Description'
              ? 3
              : 1, // Giving more space to Description
          child: pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: tableHeaderDecoration,
            child: pw.Text(header,
                style: pw.TextStyle(
                    color: customHeaderTextColor,
                    fontWeight: pw.FontWeight.bold)),
            alignment: cellAlignment,
          ),
        );
      }).toList());
    }

// Custom function to generate table row for each item
    pw.Widget _buildTableRow(List<dynamic> row) {
      return pw.Row(
          children: row.asMap().entries.map((entry) {
        int idx = entry.key;
        var cell = entry.value;
        return pw.Expanded(
          flex: idx == 0
              ? 3
              : 1, // Giving more space to the first column, Description
          child: pw.Container(
            alignment: cellAlignment,
            padding: const pw.EdgeInsets.all(4),
            child: pw.Text(cell.toString(), style: cellStyle),
          ),
        );
      }).toList());
    }

    // Save the document
    // final file = File('Invoice.pdf');
    // await file.writeAsBytes(await pdf.save());

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/invoice.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());

    return path;
    // Share the document
  }

  Future<void> sendPDF() async {
    final path = await generateInvoicePdf();
    Share.shareFiles([path], text: 'Your Transaction Receipt');
  }

  Future<void> previewPDF() async {
    final path = await generateInvoicePdf();
    navigationService.push(
      PdfViewerPage(
        path: path,
      ),
    );
  }

  Future<pw.ImageProvider> _fetchImageProvider() async {
    // Fetch your logo image from assets or network
    // For example, to load an image from assets:
    return pw.MemoryImage(
        (await rootBundle.load("assets/png/payme.png")).buffer.asUint8List());
  }
}
