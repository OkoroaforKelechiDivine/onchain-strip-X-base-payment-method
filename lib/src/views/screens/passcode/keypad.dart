import 'package:flutter/material.dart';
import 'package:pay_me_mobile/src/views/screens/passcode/components/dotted_circle.dart';
import 'package:pay_me_mobile/src/views/screens/passcode/components/keypad_buttons.dart';
import 'package:pay_me_mobile/src/views/screens/passcode/components/passcode_text.dart';

class Keypad extends StatelessWidget {
  final Function(String) onButtonPressed;
  final List<String> enteredDigits;

  const Keypad({
    super.key, required this.onButtonPressed, required this.enteredDigits
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Column(
        children: [
          const BuildPasscodeText(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int index = 0; index < 6; index++)
                BuildDottedCircle(index: index, enteredDigits: enteredDigits),
            ],
          ),
          BuildKeyPadButtons(onButtonPressed: onButtonPressed, enteredDigits: enteredDigits),
        ],
      ),
    );
  }
}