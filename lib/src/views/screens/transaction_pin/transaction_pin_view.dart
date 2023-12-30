import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/widgets/screen_button.dart';
import 'package:pay_me_mobile/src/views/screens/transaction_pin/transaction_pin_viewmodel.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/cores.dart';

class TransactionPinView extends StatelessWidget {
  final Function(String? val) onPinComplete;
  const TransactionPinView({super.key, required this.onPinComplete});

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 46,
      height: 46,
      textStyle: const TextStyle(
        fontSize: 40,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TransactionPinViewModel(),
      builder: (context, model, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const AppText(
              'Enter Transaction Pin',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(height: 20),
            // const Text(
            //   'Enter your transaction pin to continue',
            //   style: TextStyle(
            //     fontSize: 16,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
            // const SizedBox(height: 20),
            // const SizedBox(height: 20),
            // const SizedBox(height: 20),
            // const
            Center(
              child: Pinput(
                controller: model.pinController,
                focusNode: model.focusNode,
                obscureText: true,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                // validator: (value) {
                //   //return value == '2222' ? null : 'Pin is incorrect';
                // },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) async {
                  debugPrint('onChanged: $value');
                  if (value.length == 4) {
                    if (appGlobals.user!.isTransactionPinSet!) {
                      onPinComplete(value);
                    } else {
                      snackbarService.error(
                          message: "Please Set Transaction Pin");
                    }
                    //await model.onPassCode();
                  }
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    //color: Colors.red,
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    //height: MediaQuery.of(context).size.height * 0.5,
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('1');
                              },
                              digit: '1',
                            ),
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('2');
                              },
                              digit: '2',
                            ),
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('3');
                              },
                              digit: '3',
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('4');
                              },
                              digit: '4',
                            ),
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('5');
                              },
                              digit: '5',
                            ),
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('6');
                              },
                              digit: '6',
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('7');
                              },
                              digit: '7',
                            ),
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('8');
                              },
                              digit: '8',
                            ),
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('9');
                              },
                              digit: '9',
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const EmptyScreenButton(),
                            ScreenButton(
                              onPressed: () {
                                model.onButtonClick('0');
                              },
                              digit: '0',
                            ),
                            BackSpaceButton(
                              onPressed: () {
                                model.onBackspace();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
