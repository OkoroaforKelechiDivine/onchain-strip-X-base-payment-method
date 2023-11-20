import 'package:flutter/cupertino.dart';

class BuildLockImage extends StatelessWidget {
  const BuildLockImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/jpg/lock.jpg",
      height: 50,
    );
  }
}
