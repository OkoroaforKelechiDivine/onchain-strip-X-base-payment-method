import 'package:flutter/material.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_viewmodel.dart';
import 'package:pay_me_mobile/presentation/transfer/transfer_viewmodel.dart';

class NewTransfer extends StatelessWidget {
  final TransferViewModel model;
  const NewTransfer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppText("This is new transfer")
      ],
    );
  }
}
