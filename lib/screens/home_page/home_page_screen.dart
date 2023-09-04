import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_config/manager/font_manager.dart';
import '../../app_config/manager/theme_manager.dart';
import '../../views/custom_button/custom_bottom_bar_navigation.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  bool isAmountVisible = false;
  int _currentIndex = 0;

  static const dynamicAmount = "₦ 24,607,034.02";
  static const addMoneyImage = 'assets/jpg/add_money.jpg';
  static const transferImage = 'assets/jpg/transfer.jpg';
  static const posDeviceImage = 'assets/jpg/pos_device.jpg';
  static const bankImage = 'assets/jpg/bank.jpg';
  static const raisePaymentImage = 'assets/jpg/raise_payment.jpg';
  static const approvedPaymentImage = 'assets/jpg/approved_payment.jpg';
  static const outletImage = "assets/jpg/outlet.jpg";
  static const transactionHistoryImage = "assets/jpg/history.jpg";
  static const buyAirtimeImage = "assets/jpg/mobile.jpg";
  static const buyPowerImage = "assets/jpg/buy_power.jpg";
  static const moreImage = "assets/jpg/more.jpg";

  List<String> outletNames = [
    'Outlet',
    'Transaction\n \t\t\t\tHistory',
    'Buy Airtime',
    'Buy Power',
    'POS Device',
    'More',
  ];

  void toggleVisibility() {
    setState(() {
      isAmountVisible = !isAmountVisible;
    });
  }

  String hideDigits(String amount) {
    String cleanedAmount = amount.replaceAll(RegExp(r'[₦,.]'), '');
    return cleanedAmount.replaceAll(RegExp(r'\d'), '*');
  }

  PreferredSize _buildHeader() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
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
    );
  }

  Widget _buildBalanceCard() {
    final displayedAmount = isAmountVisible ? dynamicAmount : hideDigits(dynamicAmount);
    return Card(
      color: AppColors.lightGreen,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  displayedAmount,
                  style: GoogleFonts.philosopher(
                    fontSize: AppFontSize.size30,
                    color: AppColors.deepWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isAmountVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.deepWhite,
                  ),
                  onPressed: toggleVisibility,
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
            const SizedBox(height: 5),
            const Text(
              'Account Status: MERCHANT',
              style: TextStyle(
                fontSize: AppFontSize.size12,
                fontWeight: AppFontWeight.bold,
                color: AppColors.deepWhite,
              ),
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionColumn(addMoneyImage, 'Add Money', () {}, textColor: AppColors.pureWhite),
                _buildActionColumn(transferImage, 'Transfer', () { Navigator.of(context).pushReplacementNamed('/transfer');}, textColor: AppColors.pureWhite),
                _buildActionColumn(posDeviceImage, 'POS Device', () {}, textColor: AppColors.pureWhite),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildActionColumn(String imageAsset, String label, VoidCallback onPressed, {required Color textColor}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.deepWhite,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconButton(
            icon: Image.asset(imageAsset),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: AppFontSize.size12,
            fontWeight: AppFontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildMoneyTransferCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0,10.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionColumn(bankImage, 'To Bank', () {}, textColor: AppColors.lightGreen),
                  _buildActionColumn(raisePaymentImage, 'Raise Payment', () {}, textColor: AppColors.lightGreen),
                  _buildActionColumn(approvedPaymentImage, 'Approve Payments', () {}, textColor: AppColors.lightGreen),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceHeader() {
    return Padding(
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
              fontWeight: AppFontWeight.light,
              color: AppColors.lightBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String image, String imageLabel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 10.0, 16.0, 26.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 55,
              height: 55,
              child: IconButton(
                icon: Image.asset(image),
                onPressed: () {},
              ),
            ),
            Text(
              imageLabel,
              style: const TextStyle(
                fontSize: AppFontSize.size12,
                fontWeight: AppFontWeight.semiBold,
                color: AppColors.lightGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> outletImages = [
      outletImage,
      transactionHistoryImage,
      buyAirtimeImage,
      buyPowerImage,
      posDeviceImage,
      moreImage,
    ];

    return Scaffold(
      appBar: _buildHeader(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildBalanceCard(),
          ),
          SliverToBoxAdapter(
            child: _buildMoneyTransferCard(),
          ),
          SliverToBoxAdapter(
            child: _buildServiceHeader(),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _buildServiceCard(outletImages[index], outletNames[index]);
              },
              childCount: 6,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}