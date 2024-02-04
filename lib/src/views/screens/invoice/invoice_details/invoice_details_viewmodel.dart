import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_me_mobile/core/utilities/string_util.dart';
import 'package:pay_me_mobile/data/model/response/invoice/single_invoice_response.dart';
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

  Future<void> generateInvoicePdf() async {
    final pdf = pw.Document();
    final imageProvider = await _fetchImageProvider();
    String issuedDate = 'Issued: ${formartDate(invoice!.createdAt.toString())}';
    String dueDate = 'Due: ${formartDate(invoice!.dueDate.toString())}';

    final headers = ['Description', 'Quantity', 'Rate', 'Total'];
    final data = invoice!.items
        .map((item) => [
              item.description,
              '${item.quantity}',
              '${item.pricePerUnit}',
              '${item.amount}',
            ])
        .toList();

    // Calculate totals
    final subtotal = invoice!.items
        .fold(0.0, (sum, item) => sum + double.parse(item.amount.toString()));
    final tax = subtotal * 0.1; // Example tax rate of 10%
    final discount = subtotal * 0.05; // Example discount of 5%
    final total = subtotal + tax - discount;

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
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Image(imageProvider, width: 150),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
            pw.Text(issuedDate),
            pw.Text(dueDate),
          ]),
        ]),
        pw.SizedBox(height: 20),

        /// Items Table with Custom Styles
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey, width: 0.5),
          children: [
            pw.TableRow(
              decoration: pw.BoxDecoration(color: customHeaderBackgroundColor),
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

        // Subtotal, Tax, Discount, and Total
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw
              .Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
            pw.Text('Subtotal: NGN${invoice!.totalAmount.toStringAsFixed(2)}'),
            pw.Text(
                'Tax: NGN${invoice!.tax != null ? tax.toStringAsFixed(2) : 0.0}'),
            pw.Text(
                'Discount: -\$${invoice!.discount != null ? discount.toStringAsFixed(2) : 0.0}'),
            pw.Text('Total: NGN ${invoice!.totalAmount.toStringAsFixed(2)}',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ]),
        ),
        pw.SizedBox(height: 20),

        // Account Details
        pw.Container(
          padding: pw.EdgeInsets.all(16),
          decoration: pw.BoxDecoration(
              borderRadius: pw.BorderRadius.circular(10),
              color: PdfColor.fromInt(0xFFE6F9F9)),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("Payment should be made to:",
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black,
                  )),
              pw.SizedBox(height: 20),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Acc. Name:",
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: greyTextColor,
                      )),
                  pw.Text(appGlobals.user!.accountName!,
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: greyTextColor,
                      )),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Acc. Number:",
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: greyTextColor,
                      )),
                  pw.Text(appGlobals.user!.accountNumber!,
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: greyTextColor,
                      )),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Bank Name",
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: greyTextColor,
                      )),
                  pw.Text("VFD Bank",
                      style: pw.TextStyle(
                        fontSize: 16,
                        fontWeight: pw.FontWeight.bold,
                        color: greyTextColor,
                      )),
                ],
              )
            ],
          ),
        ),
      ],
    ));

    // Save the document
    // final file = File('Invoice.pdf');
    // await file.writeAsBytes(await pdf.save());

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/invoice.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());

    // Share the document
    Share.shareFiles([path], text: 'Your Transaction Receipt');
  }

  Future<pw.ImageProvider> _fetchImageProvider() async {
    // Fetch your logo image from assets or network
    // For example, to load an image from assets:
    return pw.MemoryImage(
        (await rootBundle.load("assets/png/payme.png")).buffer.asUint8List());
  }
}
