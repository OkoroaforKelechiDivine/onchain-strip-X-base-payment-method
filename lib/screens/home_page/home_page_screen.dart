import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_config/manager/font_manager.dart';
import '../../app_config/manager/theme_manager.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String dynamicAmount = "\u20A6100,000";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Hi, Adeola',
              style: TextStyle(
                fontSize: AppFontSize.size30,
                color: AppColors.lightBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Card(
                color: AppColors.lightGreen,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dynamicAmount,
                            style: GoogleFonts.philosopher(
                              fontSize: AppFontSize.size30,
                              color: AppColors.deepWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Text(
                        'ACCOUNT NUMBER: 157766678939',
                        style: TextStyle(
                          fontSize: AppFontSize.size12,
                          fontWeight: AppFontWeight.bold,
                          color: AppColors.deepWhite,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Add Money',
                                style: TextStyle(
                                  fontSize: AppFontSize.size12,
                                  fontWeight: AppFontWeight.bold,
                                  color: AppColors.deepWhite,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed('/transfer');
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Transfer',
                                style: TextStyle(
                                  fontSize: AppFontSize.size12,
                                  fontWeight: AppFontWeight.bold,
                                  color: AppColors.deepWhite,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.point_of_sale),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'POS Device',
                                style: TextStyle(
                                  fontSize: AppFontSize.size12,
                                  fontWeight: AppFontWeight.bold,
                                  color: AppColors.deepWhite,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Money Transfer',
                        style: TextStyle(
                          fontSize: AppFontSize.size16,
                          fontWeight: AppFontWeight.light,
                          color: AppColors.lightBlack,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.business, size: 35, color: AppColors.lightGreen),
                                onPressed: () {},
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'To Bank',
                                style: TextStyle(
                                  fontSize: AppFontSize.size12,
                                  fontWeight: AppFontWeight.bold,
                                  color: AppColors.lightGreen,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.payment, size: 35, color: AppColors.lightGreen),
                                onPressed: () {},
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Raise Payment',
                                style: TextStyle(
                                  fontSize: AppFontSize.size12,
                                  fontWeight: AppFontWeight.bold,
                                  color: AppColors.lightGreen,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.check_circle, size: 35, color: AppColors.lightGreen),
                                onPressed: () {},
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Approve Payments',
                                style: TextStyle(
                                  fontSize: AppFontSize.size12,
                                  fontWeight: AppFontWeight.bold,
                                  color: AppColors.lightGreen,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 30.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service',
                    style: GoogleFonts.inter(
                      fontSize: AppFontSize.size16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightBlack,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'More >',
                    style: TextStyle(
                      fontSize: AppFontSize.size12,
                      fontWeight: AppFontWeight.bold,
                      color: AppColors.lightBlack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}