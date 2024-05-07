import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pay_me_mobile/core/constants/colors.dart';
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
      appBar: AppBar(
        title: Center(child: Image.asset(AppAssets.newPayme, width: 100.w)),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            child: CarouselSlider(
              items: imageData.map((data) => ImageWithTitleAndContent(
                image: data['image']!,
                title: data['title']!,
                content: data['text']!,
              )).toList(),
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
          Positioned(
            left: 16,
            bottom: 16,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      imageData.length, (index) => Container(
                        width: 8.w,
                        height: 8.w,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == _currentCarouselIndex ? AppColors.brightGreen : AppColors.white,
                          border: index != _currentCarouselIndex ? Border.all(color: Colors.black) : null, // Apply border color only to inactive indicators
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.deepGreen,
                        ),
                        child: Text(
                          _currentCarouselIndex == imageData.length - 1 ? 'Sign up' : 'Skip',
                          style: const TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
