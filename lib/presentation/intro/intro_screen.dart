import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/intro/widget/image_with_title_and_content.dart';

import '../../core/constants/app_assets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> imageData = [
      {
        'image': AppAssets.firstCarouselImage,
        'title': 'Cost- Efficiency',
        'text': 'Save on transaction costs and boost\n your profitability',
      },
      {
        'image': AppAssets.secondCarouselImage,
        'title': 'Increased Revenue',
        'text': 'Streamlined payment processes\n lead to higher revenue',
      },
      {
        'image': AppAssets.thirdCarouselImage,
        'title': 'Digital Solutions',
        'text': 'Cutting-edge payment solutions for online and mobile payments',
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(child: Image.asset(AppAssets.newPayme, width: 100.w)),
            Expanded(
              child: CarouselSlider(
                items: imageData
                    .map((data) => ImageWithTitleAndContent(
                          image: data['image']!,
                          title: data['title']!,
                          content: data['text']!,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 700.h,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      imageData.length,
                      (index) => Container(
                        width: 10.w,
                        height: 10.w,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == _currentCarouselIndex
                              ? AppColors.brightGreen
                              : AppColors.white,
                          border: index != _currentCarouselIndex
                              ? Border.all(color: Colors.black)
                              : null,
                        ),
                      ),
                    ),
                  ),
                  //const Spacer(),
                  AppButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    onPressed: () {},
                    title: 'Next',
                    width: 100.w,
                    height: 40.h,
                    radius: 100,
                    child: AppText(
                      _currentCarouselIndex == imageData.length - 1
                          ? 'Sign up'
                          : 'Skip',
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    color: AppColors.deepGreen,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: AppColors.deepGreen,
                  //   ),
                  //   child:
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
