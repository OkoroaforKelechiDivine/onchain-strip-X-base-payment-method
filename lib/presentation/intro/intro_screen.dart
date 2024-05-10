import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay_me_mobile/core/cores.dart';
import 'package:pay_me_mobile/presentation/auth/sign_in/sign_in_view.dart';
import 'package:pay_me_mobile/presentation/intro/intro_view_model.dart';
import 'package:pay_me_mobile/presentation/intro/widget/image_with_title_and_content.dart';
import 'package:stacked/stacked.dart';

import '../../core/constants/app_assets.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => IntroViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    AppAssets.lightOval,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                        child: Image.asset(AppAssets.newPayme, width: 100.w)),
                    Expanded(
                      child: CarouselSlider(
                        items: model.imageData
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
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 1,
                          onPageChanged: (index, _) {
                            model.setCarouselIndex(index);
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 21, right: 21, bottom: 21),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(
                              model.imageData.length,
                              (index) => Container(
                                width: 10.w,
                                height: 10.w,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == model.currentCarouselIndex
                                      ? AppColors.demonicGreen
                                      : AppColors.white,
                                  border: index != model.currentCarouselIndex
                                      ? Border.all(color: AppColors.black)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                          AppButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            onPressed: () {
                              navigationService.push(SignInView());
                            },
                            title: 'Next',
                            width: 150.w,
                            height: 35.h,
                            radius: 100.r,
                            color: AppColors.deepGreen,
                            child: AppText(
                              model.currentCarouselIndex ==
                                      model.imageData.length - 1
                                  ? 'Start'
                                  : 'Skip',
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 20.h),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
