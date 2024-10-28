import 'package:flutter/material.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/models/OnbordingModel.dart';
// ignore: depend_on_referenced_packages
import 'package:dots_indicator/dots_indicator.dart';

// ignore: must_be_immutable
class OnboardingCard extends StatelessWidget {
  final List<OnboardingModel> onBoardingList;
  final int currentIndex;
  PageController pageController;

  OnboardingCard({
    super.key,
    required this.onBoardingList,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.kGrey3Color,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), topLeft: Radius.circular(25))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 35, right: 34),
              child: Text(
                pageViewList[currentIndex].title,
                textAlign: TextAlign.center,
                style: AppTypography.kBold24
                    .copyWith(color: AppColors.kLightAccentColor),
              ),
            ),
            Text(
              pageViewList[currentIndex].subtitle,
              textAlign: TextAlign.center,
              style: AppTypography.kSemiBold14
                  .copyWith(color: AppColors.kLightAccentColor),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: DotsIndicator(
                dotsCount: onBoardingList.length,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  color: Colors.grey.withOpacity(0.5),
                  size: const Size.square(8.0),
                  activeSize: const Size(20.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  activeColor: AppColors.kPrimary,
                ),
              ),
            ),
          ],
        ));
  }
}
