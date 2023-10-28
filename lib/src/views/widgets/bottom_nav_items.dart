import 'package:flutter/material.dart';

 const homeImage = "assets/jpg/home.jpg";
 const transactionHistoryImage = "assets/jpg/history.jpg";
 const buyAirtimeImage = "assets/jpg/mobile.jpg";
 const buyPowerImage = "assets/jpg/buy_power.jpg";

bottomNavItems(BuildContext context, int currentIndex) {
  return [
    BottomNavigationBarItem(
      icon: Opacity(
          opacity: currentIndex == 0 ? 1.0 : 0.5,
          child: Image.asset(homeImage,height: 20,width: 20,)),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Opacity(
          opacity: currentIndex == 1 ? 1.0 : 0.5,
          child: Image.asset(transactionHistoryImage,height: 20,width: 20,)),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Opacity(
          opacity: currentIndex == 2 ? 1.0 : 0.5,
          child: Image.asset(buyAirtimeImage,height: 20,width: 20,)),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Opacity(
          opacity: currentIndex == 3 ? 1.0 : 0.5,
          child: Image.asset(buyPowerImage,height: 20,width: 20,)),
      label: '',
    )
  ];
}