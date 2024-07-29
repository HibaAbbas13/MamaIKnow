import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Screens/HomeScreen/HomeScreen.dart';
import 'package:mamaiknow/Screens/Trackers/Components/TrackerCard.dart';
import 'package:mamaiknow/models/TrackerModels.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  bool isSelected = false;

  List<Widget> pages = [
    HomeScreen(),
    TrackerCard(
      uppercard: uppercardlist,
    ),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.kGrey02,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.klime,
        unselectedItemColor: AppColors.kblueGrey,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppIcons.home,
            ),
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
            icon: SvgPicture.asset(AppIcons.guideline,
                color: AppColors.kblueGrey),
            label: 'Guides',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppIcons.profile),
            icon:
                SvgPicture.asset(AppIcons.profile, color: AppColors.kblueGrey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
