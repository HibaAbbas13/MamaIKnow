import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mamaiknow/Screens/Auth/SignInScreen.dart';
import 'package:mamaiknow/widgets/primary_button.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Screens/OnBoradingScreen/components/onbording_card.dart';
import 'package:mamaiknow/models/OnbordingModel.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Column(
        children: [
          Expanded(
            child: Image.asset(pageViewList[_currentIndex].image),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: pageViewList.length,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingCard(
                  onBoardingList: pageViewList,
                  currentIndex: index,
                  pageController: pageController,
                );
              },
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 150,
        width: double.infinity, // Increased height of the bottom sheet
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Add some top padding
            PrimaryButton(
              onTap: () {
                if (_currentIndex == pageViewList.length - 1) {
                  Get.to(const SignInScreen());
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              text: _currentIndex == pageViewList.length - 1
                  ? 'Get Started'
                  : 'Continue',
              bgColor: AppColors.kPrimary,
              borderRadius: 8,
              height: 48,
              width: 250,
              textColor: AppColors.kWhiteColor,
            ),
            const SizedBox(height: 20), // Add some bottom padding
          ],
        ),
      ),
    );
  }
}
