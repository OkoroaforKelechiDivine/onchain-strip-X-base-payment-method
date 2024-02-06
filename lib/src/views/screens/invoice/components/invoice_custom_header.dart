import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/cores.dart';

class InvoiceCustomHeader extends StatelessWidget {
  const InvoiceCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            navigationService.pop();
          },
          child: SvgPicture.asset(
            AppAssets.arrowBack,
          ),
        ),
        //SvgPicture.asset(AppAssets.magicStar),
      ],
    );
  }
}
