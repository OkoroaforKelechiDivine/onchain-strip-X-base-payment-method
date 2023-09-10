import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay_me_mobile/app_config/manager/font_manager.dart';
import 'package:pay_me_mobile/app_config/manager/theme_manager.dart';

class RepeatTransactionScreen extends StatefulWidget {
  final String amount;
  final DateTime transactionTimestamp;
  final String accountName;
  final String description;
  final bool isSent;

  const RepeatTransactionScreen({
    super.key,
    required this.amount,
    required this.transactionTimestamp,
    required this.accountName,
    required this.description,
    required this.isSent,
  });

  @override
  State<RepeatTransactionScreen> createState() => _RepeatTransactionScreenState();
}

class _RepeatTransactionScreenState extends State<RepeatTransactionScreen> {

  final TextEditingController amountController = TextEditingController();
  final TextEditingController narrationController = TextEditingController();

  final GlobalKey<FormState> amountKey = GlobalKey<FormState>();
  final GlobalKey<FormState> narrationKey = GlobalKey<FormState>();

  bool amountError = false;
  bool narrationError = false;

  @override
  void dispose() {
    amountController.dispose();
    narrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 58.0),
          child: Text(
            widget.accountName,
            style: const TextStyle(
              fontSize: AppFontSize.size20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: AppColors.lightBlack,
                    fontWeight: AppFontWeight.bold,
                    fontSize: AppFontSize.size18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: widget.isSent ? 220 : 0,
                right: widget.isSent ? 0 : 220,
                top: 50,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/transaction_details");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                          ),
                        ),
                        color: widget.isSent ? AppColors.lightGreen : AppColors.lightBlue.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.amount,
                                style: CustomStyles.transactionHistoryDetailTextStyle,
                              ),
                              const SizedBox(height: 20),
                              const Divider(),
                              Text(
                                widget.description,
                                style: CustomStyles.transactionHistoryDetailTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        "${widget.transactionTimestamp.hour.toString().padLeft(2, '0')}:${widget.transactionTimestamp.minute.toString().padLeft(2, '0')} ${widget.transactionTimestamp.hour >= 12 ? 'PM' : 'AM'}",
                        style: TextStyle(
                          fontSize: AppFontSize.size12,
                          color: AppColors.lightBlack,
                          fontWeight: AppFontWeight.bold,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Tap on a Message to use transaction details",
              style: TextStyle(
                color: AppColors.lightBlack,
              ),
            ),
            const SizedBox(height: 300),
            ElevatedButton(
              onPressed: () {
                if (amountController.text.isNotEmpty && narrationController.text.isNotEmpty) {
                  setState(() {
                    amountError = false;
                    narrationError = false;
                  });
                } else {
                  setState(() {
                    amountError = amountController.text.isEmpty;
                    narrationError = narrationController.text.isEmpty;
                  });
                }
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                  barrierColor: AppColors.lightBlack.withOpacity(0.5),
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                    return Material(
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20),
                          color: AppColors.pureWhite,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                                  child: SizedBox(
                                    height: 60,
                                    width: 400,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(1.0, 0.0, 10.0, 0.0),
                                      child: Card(
                                        color: AppColors.lightGreen,
                                        child: Center(
                                          child: Text(
                                            "NGN Balance: ${double.tryParse(widget.amount.replaceAll('₦', '').replaceAll(',', '').trim())?.toStringAsFixed(2) ?? 'Invalid'}",
                                            style: TextStyle(
                                              fontSize: AppFontSize.size16,
                                              fontWeight: AppFontWeight.bold,
                                              fontFamily: GoogleFonts.inter().fontFamily,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Material(
                                        elevation: 4,
                                        child: Container(
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          color: AppColors.lightBlue,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10.0),
                                            child: TextField(
                                              decoration: const InputDecoration(
                                                hintText: '₦ 0.00',
                                                hintStyle: TextStyle(
                                                    color: AppColors.lightBlack,
                                                    fontWeight: AppFontWeight.bold,
                                                    fontSize: AppFontSize.size20
                                                ),
                                                filled: true,
                                                fillColor: AppColors.lightBlue,
                                                border: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                fontSize: AppFontSize.size16,
                                                color: AppColors.lightBlack,
                                                fontFamily: GoogleFonts.inter().fontFamily,
                                                fontWeight: AppFontWeight.bold,
                                              ),
                                              keyboardType: TextInputType.number,
                                              inputFormatters: <TextInputFormatter>[
                                                FilteringTextInputFormatter.digitsOnly,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40.0),
                                      child: Text(
                                        'NGN',
                                        style: TextStyle(
                                          fontSize: AppFontSize.size20,
                                          color: AppColors.lightBlack,
                                          fontWeight: AppFontWeight.bold,
                                          fontFamily: GoogleFonts.alegreyaSans().fontFamily,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Material(
                                        child: Container(
                                          height: 50,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          color: AppColors.lightGreen,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Narration (eg: Sent from Kelechi)',
                                              hintStyle: TextStyle(
                                                  color: AppColors.darkWhite.withOpacity(1),
                                                  fontWeight: AppFontWeight.bold,
                                                  fontSize: AppFontSize.size12
                                              ),
                                              filled: true,
                                              fillColor: AppColors.lightGreen,
                                              border: InputBorder.none,
                                            ),
                                            style: TextStyle(
                                              fontSize: AppFontSize.size16,
                                              color: AppColors.pureWhite,
                                              fontFamily: GoogleFonts.inter().fontFamily,
                                              fontWeight: AppFontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, "/pin_dialog", arguments: {
                                          'amount': widget.amount,
                                          'accountName': widget.accountName,
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 50.0),
                                        child: Image.asset(
                                          'assets/jpg/send.jpg',
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    );},
                  transitionBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                    return SlideTransition(
                      position: Tween(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                );
              },
              child: const Text(
                "Submit",
                style: TextStyle(color: AppColors.pureWhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomStyles {
  static TextStyle transactionHistoryDetailTextStyle = TextStyle(
    fontSize: AppFontSize.size18,
    color: AppColors.pureWhite,
    fontFamily: GoogleFonts.inter().fontFamily,
    fontWeight: AppFontWeight.bold,
  );
}
