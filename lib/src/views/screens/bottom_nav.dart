import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

import 'bottom_nav_vm.dart';
import '../widgets/bottom_nav_items.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BottomNavViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 20.0,
            selectedFontSize: 14.0,
            unselectedFontSize: 14.0,
            enableFeedback: true,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(
              color: AppColors.lightGreen,
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Opacity(
                    opacity: model.currentIndex == 0 ? 1.0 : 0.5,
                    child: Image.asset(
                      homeImage,
                      height: 20,
                      width: 20,
                    )),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Opacity(
                    opacity: model.currentIndex == 1 ? 1.0 : 0.5,
                    child: Image.asset(
                      transactionHistoryImage,
                      height: 20,
                      width: 20,
                    )),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Opacity(
                  opacity: model.currentIndex == 2 ? 1.0 : 0.5,
                  child: const Icon(Icons.person),
                ),
                label: '',
              )
            ],
            currentIndex: model.currentIndex,
            selectedItemColor: AppColors.lightGreen,
            onTap: model.updateIndex,
          ),
          body: model.children[model.currentIndex],
        );
      },
    );
  }
}
