import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/OnBoarding.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Models/OnbordingModel.dart';
import 'package:mamaiknow/Screens/OnBorading/components/onbording_card.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ksemiTransparentGrey,
      body: Padding(
        padding: const EdgeInsets.only(top: 84),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: controller.onPageChanged,
                itemCount: onboardingList.length,
                itemBuilder: (context, index) {
                  final onboarding = onboardingList[index];
                  return OnBoardingCard(onboarding: onboarding);
                },
              ),
            ),
            Obx(() {
              return onboardingList[controller.currentIndex.value]
                      .hasSignUpSignInButtons
                  ? Column(
                      children: [
                        Container(
                          height: 50.h,
                          width: 350.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.klime,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: Center(
                              child: Text(
                                "SignUp",
                                style: AppTypography.kLight14
                                    .copyWith(color: AppColors.kBlack),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          height: 50.h,
                          width: 350.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: AppColors.kGrey01,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: Center(
                              child: Text(
                                "SignIn",
                                style: AppTypography.kLight14
                                    .copyWith(color: AppColors.kWhite),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink();
            }),
            SizedBox(height: 50.h),
            Obx(() {
              return TextButton(
                onPressed: controller.nextPage,
                child: Container(
                  width: 64.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.klime),
                  ),
                  child: Center(
                    child: onboardingList[controller.currentIndex.value]
                            .showArrowButton
                        ? Icon(
                            Icons.arrow_forward_rounded,
                            color: AppColors.klime,
                          )
                        : Text(
                            "Finish",
                            style: AppTypography.kLight14
                                .copyWith(color: AppColors.klime),
                          ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}