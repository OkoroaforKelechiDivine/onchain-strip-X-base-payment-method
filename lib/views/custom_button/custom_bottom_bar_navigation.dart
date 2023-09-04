import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double imageSize = 28.0;

  static const homeImage = "assets/jpg/home.jpg";
  static const transactionHistoryImage = "assets/jpg/history.jpg";
  static const buyAirtimeImage = "assets/jpg/mobile.jpg";
  static const buyPowerImage = "assets/jpg/buy_power.jpg";

  const CustomBottomNavigationBar({super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            width: imageSize,
            height: imageSize,
            child: Image.asset(homeImage),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: imageSize,
            height: imageSize,
            child: Image.asset(transactionHistoryImage),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: imageSize,
            height: imageSize,
            child: Image.asset(buyAirtimeImage),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: imageSize,
            height: imageSize,
            child: Image.asset(buyPowerImage),
          ),
          label: '',
        ),
      ],
    );
  }
}
