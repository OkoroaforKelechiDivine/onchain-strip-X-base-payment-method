// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../../../../app_config/manager/font_manager.dart';
// import '../../../../../../core/constants/colors.dart';
// import '../../../beneficiary/beneficiary_details.dart';
// import '../transfer_to_bank_screen.dart';

// class BuildBeneficiary extends StatefulWidget {
//   final BuildContext context;

//   const BuildBeneficiary({super.key, required this.context});

//   @override
//   State<BuildBeneficiary> createState() => _BuildBeneficiaryState();
// }

// class _BuildBeneficiaryState extends State<BuildBeneficiary> {
//   get randomColor => null;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 10),
//         const Padding(
//           padding: EdgeInsets.only(left: 15, right: 15),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Beneficiaries",
//                 style: TextStyle(
//                   color: AppColors.lightBlack,
//                   fontWeight: AppFontWeight.bold,
//                   fontSize: AppFontSize.size14,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'View All',
//                     style: TextStyle(
//                       color: AppColors.lightGrey,
//                       fontWeight: AppFontWeight.bold,
//                       fontSize: AppFontSize.size14,
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Icon(
//                     Icons.arrow_forward_ios,
//                     color: AppColors.lightGrey,
//                     size: AppFontSize.size14,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: dummyBanks.map((transaction) {
//               final firstLetter = transaction.accountName.isNotEmpty ? transaction.accountName[0].toUpperCase() : '';
//               // final randomColor = Color(0xFF000000 + Random().nextInt(0xFFFFFF));
//               final splitAccountNameIntoWords = transaction.accountName.split(' ');
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => BeneficiaryDetailPage(
//                         circleColor: randomColor,
//                         accountName: transaction.accountName,
//                         logo: transaction.logo,
//                         accountNumber: transaction.accountNumber,
//                       ),
//                     ),
//                   );
//                 },
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 50,
//                       height: 50,
//                       margin: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: randomColor,
//                       ),
//                       child: Center(
//                         child: Text(
//                           firstLetter,
//                           style: TextStyle(
//                             fontWeight: AppFontWeight.bold,
//                             fontSize: AppFontSize.size18,
//                             fontFamily: GoogleFonts.alegreyaSans().fontFamily,
//                             color: AppColors.pureWhite,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Column(
//                       children: splitAccountNameIntoWords.map((word) => Text(
//                         word,
//                         style: TextStyle(
//                           fontWeight: AppFontWeight.bold,
//                           fontSize: AppFontSize.size14,
//                           fontFamily: GoogleFonts.alegreyaSans().fontFamily,
//                           color: AppColors.lightBlack,
//                         ),
//                       )).toList(),
//                     ),
//                     const SizedBox(height: 20)
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }
// }
