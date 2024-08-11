import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/Landing.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Screens/HomeScreen/HomeScreen.dart';
import 'package:mamaiknow/Screens/Trackers/TrackerScreen.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using Get.put()
    final LandingPageController controller = Get.put(LandingPageController());

    // List of pages
    List<Widget> pages = [
      HomeScreen(),
      TrackerScreen(),
      Container(),
      Container(),
      Container(),
    ];

    return Scaffold(
      extendBody: true,
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        backgroundColor: AppColors.kGrey02,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.klime,
        unselectedItemColor: AppColors.kblueGrey,
        currentIndex: controller.currentIndex.value,
        onTap: (int index) {
          controller.changePage(index);
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.home),
            icon: SvgPicture.asset(AppIcons.home, color: AppColors.kblueGrey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.vector),
            icon: SvgPicture.asset(AppIcons.vector, color: AppColors.kblueGrey),
            label: 'Trackers',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.turing),
            icon: SvgPicture.asset(AppIcons.turing, color: AppColors.kblueGrey),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppIcons.guideline,
              color: AppColors.klime,
            ),
            icon: SvgPicture.asset(AppIcons.guideline, color: AppColors.kblueGrey),
            label: 'Guides',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.profile),
            icon: SvgPicture.asset(AppIcons.profile, color: AppColors.kblueGrey),
            label: 'Profile',
          ),
        ],
      )),
    );
  }
}
