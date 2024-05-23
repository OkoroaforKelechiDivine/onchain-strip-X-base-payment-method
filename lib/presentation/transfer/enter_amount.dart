import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/draggable_dialog.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/receive_message.dart';
import 'package:pay_me_mobile/presentation/transfer/widget/send_message.dart';

class EnterAmount extends StatelessWidget {
  final String accountName;

  const EnterAmount({Key? key, required this.accountName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: PaymeAppBar(
        isBack: true,
        title: accountName,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            children: <Widget>[
              ReceivedMessageBuilder().buildReceivedMessage(),
              SentMessageBuilder().buildSentMessage(),
            ],
          ),
          const DraggableDialog(),
        ],
      ),
    );
  }
}
