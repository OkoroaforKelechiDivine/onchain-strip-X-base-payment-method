import 'package:flutter/cupertino.dart';

class BuildLogo extends StatelessWidget {
  const BuildLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/png/payme.png",
      height: 50,
    );
  }
}
