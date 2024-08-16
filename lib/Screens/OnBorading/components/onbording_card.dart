import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Models/OnbordingModel.dart';

class OnBoardingCard extends StatefulWidget {
  final OnboardingModel onboarding;
  const OnBoardingCard({super.key, required this.onboarding});

  @override
  State<OnBoardingCard> createState() => _OnBoardingCardState();
}

class _OnBoardingCardState extends State<OnBoardingCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.onboarding.title,
              style:
                  AppTypography.kExtraLight12.copyWith(color: AppColors.kWhite),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              widget.onboarding.subtitle,
              style: AppTypography.kSemiBold20.copyWith(color: AppColors.klime),
            ),
            Expanded(child: Image.asset(widget.onboarding.image)),
          ],
        ));
  }
}
