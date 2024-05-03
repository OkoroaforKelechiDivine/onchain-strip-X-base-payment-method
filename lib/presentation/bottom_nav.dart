import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/core/utilities/permission.dart';
import 'package:stacked/stacked.dart';

import 'bottom_nav_vm.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BottomNavViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 20.0,
            selectedFontSize: 14.0,
            unselectedFontSize: 14.0,
            enableFeedback: true,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: const IconThemeData(
              color: AppColors.lightGreen,
            ),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Opacity(
                  opacity: model.currentIndex ==
                          (Permissions().canUserViewAllTransactions() ? 2 : 1)
                      ? 1.0
                      : 0.5,
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
