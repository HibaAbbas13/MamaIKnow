import 'package:get/get.dart';
import 'package:flutter/material.dart';
//import 'package:mamaiknow/Models/OnbordingModel.dart';
import 'package:mamaiknow/Screens/HomeScreen/HomeScreen.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < 3) {
      // Assuming there are 4 pages in the onboarding process
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      Get.to(() => HomeScreen());
    }
  }
}
