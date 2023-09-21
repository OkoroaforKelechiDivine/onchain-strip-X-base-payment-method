import 'package:flutter/material.dart';
import 'package:pay_me_mobile/data/custom/set_congratulations_screen.dart';
import 'package:pay_me_mobile/data/custom/show_processing_screen.dart';
import 'dart:ui';

import '../../app_config/manager/font_manager.dart';
import '../../app_config/manager/theme_manager.dart';


class PinDialog extends StatefulWidget {
  final double amount;
  final String accountName;

  const PinDialog({Key? key, required this.amount, required this.accountName}) : super(key: key);

  @override
  _PinDialogState createState() => _PinDialogState();
}

class _PinDialogState extends State<PinDialog> {
  List<String> enteredPins = List.filled(4, '');
  List<FocusNode> pinFocusNodes = List.generate(4, (_) => FocusNode());
  bool pinCorrect = false;

  @override
  void dispose() {
    for (var focusNode in pinFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onPinChanged(int index, String value) {
    if (value.isNotEmpty) {
      enteredPins[index] = value;
      if (index < 3) {
        FocusScope.of(context).requestFocus(pinFocusNodes[index + 1]);
      } else {
        if (enteredPins.every((pin) => pin.isNotEmpty)) {
          _showProcessingDialog();
        }
      }
    }
  }

  void _showProcessingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ProcessingDialog();
      },
    );
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.popUntil(context, (route) => route.isFirst);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CongratulationsDialog(
              amount: widget.amount, accountName: widget.accountName
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Stack(
        children: [
          Container(
            color: AppColors.pureWhite.withOpacity(0.5),
          ),
          AlertDialog(
            content: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: _buildContent(),
              ),
            ),
            title: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text('Input PIN to Pay',
                      style: TextStyle(fontSize: AppFontSize.size20)
                  ),
                  Text("₦${widget.amount.toString()}0",
                      style: CustomStyles.bankInfoTextStyle
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          color: Colors.white.withOpacity(0.5),
          child: SizedBox(
            height: 145,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int index = 0; index < 4; index++)
                        Container(
                          width: 55, // Adjust the width as needed
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lightBlue,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextField(
                            focusNode: pinFocusNodes[index],
                            textAlign: TextAlign.center,
                            obscureText: true,
                            onChanged: (value) => _onPinChanged(index, value),
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: AppFontSize.size40,
                              fontWeight: AppFontWeight.bold,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                              counterText: '',
                            ),
                            cursorHeight: 40.0,
                            cursorWidth: 2.0,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot PIN?"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> show(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width
              ),
              child: PinDialog(
                amount: widget.amount,
                accountName: widget.accountName,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomStyles {
  static const TextStyle bankInfoTextStyle = TextStyle(
    fontSize: AppFontSize.size24,
    color: AppColors.lightBlack,
    fontWeight: AppFontWeight.bold,
  );
}
