import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/di/locator.dart';
import 'package:pay_me_mobile/data/model/params/create_invoice_param.dart';
import 'package:pay_me_mobile/data/model/params/invoice_entry.dart';
import 'package:pay_me_mobile/data/model/response/invoice/get_customer_res.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stacked/stacked.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class CreateInvoiceViewModel extends BaseViewModel {
  TextEditingController customerNameTEC = TextEditingController();
  TextEditingController customerEmailAddressTEC = TextEditingController();
  TextEditingController invoiceTitleTEC = TextEditingController();
  TextEditingController discount = TextEditingController(text: "0");
  TextEditingController tax = TextEditingController(text: "0");
  TextEditingController additionalNoteTEC = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<InvoiceItem> _items = [
    InvoiceItem(description: "", pricePerUnit: 0, quantity: 0)
  ];
  String selectedDiscountType = "Fixed";
  List<String> discountList = [
    "Fixed",
    "Percentage",
  ];

  String selectedTaxType = "Fixed";
  List<String> taxList = [
    "Fixed",
    "Percentage",
  ];
  final List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  // The item that is currently selected, this should be one of the items from the list or null to start with no selection.
  GetCustomerRes? selectedCustomer;

  List<InvoiceItem> get items => _items;
  bool isSavingInvoice = false;
  double subtotal() {
    return _items.fold(0, (total, item) => total + item.amount);
  }

  double total() {
    return subtotal() - discountAmount() + taxAmount();
  }

  double discountAmount() {
    double discountValue = double.tryParse(discount.text) ?? 0;
    if (selectedDiscountType == "Fixed") {
      return discountValue;
    } else {
      return discountValue / 100 * subtotal();
    }
  }

  double taxAmount() {
    double taxValue = double.tryParse(tax.text) ?? 0;
    if (selectedTaxType == "Fixed") {
      return taxValue;
    } else {
      return taxValue / 100 * subtotal();
    }
  }

  void selectCustomer(GetCustomerRes? val) {
    selectedCustomer = val;
    customerEmailAddressTEC.text = val?.email ?? "";
    notifyListeners();
  }

  // Call this method when the discount type or value changes
  void updateTotal(String value) {
    taxAmount();
    discountAmount();
    // Call this after updating the discount value
    notifyListeners();
  }

  // Call this method when the tax type or value changes
  void updateTax(String value) {
    // Parse and set the new tax value, if needed
    // ...

    // Call this after updating the tax value
    notifyListeners();
  }

  void addItem() {
    _items.add(InvoiceItem(description: "", pricePerUnit: 0, quantity: 0));
    notifyListeners();
  }

  void selectedDiscount(String value) {
    selectedDiscountType = value;
    notifyListeners();
  }

  void selectDiscount() {
    bottomSheetService.show(
      Container(
        padding: const EdgeInsets.all(24),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedDiscount(discountList[index]);
                navigationService.pop();
              },
              child: AppText(discountList[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: discountList.length,
        ),
      ),
    );
  }

  void selectedTax(String value) {
    selectedTaxType = value;
    notifyListeners();
  }

  void selectTaxType() {
    bottomSheetService.show(
      Container(
        padding: const EdgeInsets.all(24),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedTax(taxList[index]);
                navigationService.pop();
              },
              child: AppText(taxList[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: taxList.length,
        ),
      ),
    );
  }

  // Call this whenever an item is updated
  void onItemUpdated() {
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1971),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    notifyListeners();
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  Future<void> saveInvoice(int inVoiceNumber) async {
    isSavingInvoice = true;
    notifyListeners();
    final param = CreateInvoiceParam(
      additionalNote: additionalNoteTEC.text,
      invoiceNumber: inVoiceNumber.toString(),
      customer: selectedCustomer!.id,
      dueDate: DateTime.parse("${selectedDate.toLocal()}".split(' ')[0]),
      title: invoiceTitleTEC.text,
      items: _items,
      tax: taxAmount(),
      discount: discountAmount(),
      totalAmount: total(),
    );
    final res = await invoiceRepo.createInvoice(param: param);
    if (res.success) {
      isSavingInvoice = false;
      notifyListeners();
      snackbarService.success(
          message: res.data ?? "Invoice created successfully");
      navigationService.pop();
    } else {
      snackbarService.error(message: res.message ?? "Something went wrong");
    }
    isSavingInvoice = false;
    notifyListeners();
  }

  Future<void> generateInvoicePdf() async {
    final pdf = pw.Document();
    final imageProvider = await _fetchImageProvider();
    const String issuedDate = 'Issued: 2024-02-02';
    const String dueDate = 'Due: 2024-03-02';
    final accountDetails = 'Account Details: Bank XYZ, Account No: 123456789';

    // Example data for the items table
    final items = [
      {'description': 'Item 1', 'quantity': 2, 'rate': 50.0, 'total': 100.0},
      {'description': 'Item 2', 'quantity': 1, 'rate': 70.0, 'total': 70.0},
      // Add more items as needed
    ];

    final headers = ['Description', 'Quantity', 'Rate', 'Total'];
    final data = items
        .map((item) => [
              item['description'],
              '${item['quantity']}',
              '${item['rate']}',
              '${item['total']}',
            ])
        .toList();

    // Calculate totals
    final subtotal = items.fold(
        0.0, (sum, item) => sum + double.parse(item['total'].toString()));
    final tax = subtotal * 0.1; // Example tax rate of 10%
    final discount = subtotal * 0.05; // Example discount of 5%
    final total = subtotal + tax - discount;

    // Custom colors for styling
    final PdfColor customHeaderBackgroundColor =
        PdfColor.fromInt(0xFF4A90E2); // A shade of blue
    final PdfColor customHeaderTextColor =
        PdfColor.fromInt(0xFFFFFFFF); // White
    final PdfColor customBorderColor =
        PdfColor.fromInt(0xFFCCCCCC); // Light grey

    final tableHeaderDecoration =
        pw.BoxDecoration(color: PdfColor.fromInt(0xFF053C42));
    final cellAlignment = pw.Alignment.centerLeft;
    final cellStyle = pw.TextStyle(color: PdfColors.black);
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
                            padding: pw.EdgeInsets.all(4),
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
          child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
                pw.Text('Tax: \$${tax.toStringAsFixed(2)}'),
                pw.Text('Discount: -\$${discount.toStringAsFixed(2)}'),
                pw.Text('Total: \$${total.toStringAsFixed(2)}',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              ]),
        ),
        pw.SizedBox(height: 20),

        // Account Details
        pw.Align(
          alignment: pw.Alignment.centerLeft,
          child: pw.Text(accountDetails, style: pw.TextStyle(fontSize: 12)),
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
