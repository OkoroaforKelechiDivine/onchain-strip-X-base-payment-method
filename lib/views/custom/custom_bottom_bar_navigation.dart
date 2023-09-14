import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double imageSize = 28.0;

  static const homeImage = "assets/jpg/home.jpg";
  static const transactionHistoryImage = "assets/jpg/history.jpg";
  static const buyAirtimeImage = "assets/jpg/mobile.jpg";
  static const buyPowerImage = "assets/jpg/buy_power.jpg";

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
            child: Opacity(
              opacity: currentIndex == 0 ? 1.0 : 0.5,
              child: SizedBox(
                width: imageSize,
                height: imageSize - 6.0,
                child: Image.asset(homeImage),
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/transaction_history');
            },
            child: Opacity(
              opacity: currentIndex == 1 ? 1.0 : 0.5,
              child: SizedBox(
                width: imageSize,
                height: imageSize - 6.0,
                child: Image.asset(transactionHistoryImage),
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/buy_airtime');
            },
            child: Opacity(
              opacity: currentIndex == 2 ? 1.0 : 0.5,
              child: SizedBox(
                width: imageSize,
                height: imageSize - 6.0,
                child: Image.asset(buyAirtimeImage),
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/buy_power');
            },
            child: Opacity(
              opacity: currentIndex == 3 ? 1.0 : 0.5,
              child: SizedBox(
                width: imageSize,
                height: imageSize - 6.0,
                child: Image.asset(buyPowerImage),
              ),
            ),
          ),
          label: '',
        ),
      ],
    );
  }
}
