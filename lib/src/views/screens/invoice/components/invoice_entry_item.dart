import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/data/model/params/invoice_entry.dart';

class InvoiceItem extends StatelessWidget {
  final InvoiceItemEntry entry;
  final Function onItemUpdated;
  final int index;

  const InvoiceItem(
      {Key? key,
      required this.entry,
      required this.onItemUpdated,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          'Item $index',
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 8.0),
        AppCustomTextField(
          onChanged: (value) {
            entry.description = value;
            onItemUpdated();
          },
          hintText: 'Enter item description',
          backgroundColor: Colors.white,
          borderColor: Colors.transparent,
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    'Qty',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    onChanged: (value) {
                      entry.quantity = double.tryParse(value) ?? 0;
                      onItemUpdated();
                    },
                    hintText: '0',
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    'Qty',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    onChanged: (value) {
                      entry.price = double.tryParse(value) ?? 0;
                      onItemUpdated();
                    },
                    hintText: '0',
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    'Price',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8.0),
                  AppCustomTextField(
                    readOnly: true,
                    textEditingController: TextEditingController(
                        text: entry.price.toStringAsFixed(2)),
                    onChanged: (value) {
                      entry.price = double.tryParse(value) ?? 0;
                      onItemUpdated();
                    },
                    hintText: '0',
                    backgroundColor: Colors.white,
                    borderColor: Colors.transparent,
                    textInputType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   child: Text(
            //       entry.amount.toStringAsFixed(2)), // Display calculated amount
            // ),
          ],
        ),
      ],
    );
  }
}
