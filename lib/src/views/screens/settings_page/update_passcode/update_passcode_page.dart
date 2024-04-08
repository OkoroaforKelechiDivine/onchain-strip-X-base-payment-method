import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/core/utilities/app_fonts.dart';
import 'package:pay_me_mobile/core/widgets/loader.dart';
import 'package:pay_me_mobile/src/views/screens/settings_page/update_passcode/update_passcode_vm.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/cores.dart';

class UpdatePasscodePage extends StatelessWidget {
  const UpdatePasscodePage({super.key});

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 46,
      height: 46,
      textStyle: TextStyle(
        // fontSize: 40,
        fontSize: Platform.isIOS ? 30 : 40,
        fontWeight: Platform.isIOS ? FontWeight.w700 : FontWeight.normal,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: borderColor),
      ),
    );
    return ViewModelBuilder<UpdatePasscodeVM>.reactive(
      viewModelBuilder: () => UpdatePasscodeVM(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white10,
            title: Text(
              'Update Passcode',
              style: sans(
                color: AppColors.lightGreen,
                fontSize: AppFontSize.size20,
              ),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const AppText(
                      'Enter Old Passcode',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Pinput(
                        controller: model.oldPinController,
                        //focusNode: model.focusNode,
                        obscureText: true,
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        keyboardType: TextInputType.number,
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
                          if (value.length == 6) {
                            // onPinComplete(value);
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
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const AppText(
                      'Enter New Passcode',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Pinput(
                        controller: model.newPinController,
                        //focusNode: model.newfocusNode,
                        obscureText: true,
                        length: 6,
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
                          if (value.length == 6) {
                            // onPinComplete(value);
                            await model.onChangePasscode();
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
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: model.isProcessing,
                child: const Positioned(
                  child: AppLoader(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
