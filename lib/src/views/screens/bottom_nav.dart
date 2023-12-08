import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:stacked/stacked.dart';

import 'bottom_nav_vm.dart';
import '../widgets/bottom_nav_items.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BottomNavViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0.75), // changes position of shadow
                ),
              ],
            ),
            child: BottomNavigationBar(
                onTap: (index) => model.updateIndex(index),
                type: BottomNavigationBarType.fixed,
                unselectedFontSize: 10.sp,
                selectedFontSize: 10.sp,
                selectedItemColor: AppColors.lightGreen,
                elevation: 10,
                backgroundColor: Colors.white,
                currentIndex: model.currentIndex,
                showSelectedLabels: false, // Disable labels for selected items
                showUnselectedLabels: false,
                items: bottomNavItems(context, model.currentIndex)),
          ),
          body: SafeArea(top: true, child: model.children[model.currentIndex]),
        );
      },
    );
  }
}
