import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/Authfiled_Controller.dart';
import 'package:mamaiknow/Controllers/user_controller.dart';
import 'package:mamaiknow/Screens/LandingPage.dart';

import 'package:mamaiknow/Screens/OnBoradingScreen/onboarding_view.dart';
import 'package:mamaiknow/Screens/Status/StatusScreen.dart';
import 'package:mamaiknow/Screens/loading_screen.dart';

class AuthWrapper extends StatelessWidget {
  AuthWrapper({super.key});
  final ac = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ac.user == null) {
        return const OnBoardingScreen();
      } else {
        _registerUserController();
        final uc = Get.find<UserController>();
        if (uc.user == null) {
          return const Statusscreen();
        }

        return LandingPageView();
      }
    });
  }

  void _registerUserController() {
    if (!Get.isRegistered<UserController>()) {
      Get.put(UserController(), permanent: true);
    }
  }
}
