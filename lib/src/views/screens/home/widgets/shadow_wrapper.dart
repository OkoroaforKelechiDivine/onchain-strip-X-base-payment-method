


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadowWrapper extends StatelessWidget {
  final Widget? child;
  const ShadowWrapper({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      // margin: EdgeInsets.only(left: 12.w, right: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 0.75), // changes position of shadow
              ),
            ]),
        child: child);
  }
}
