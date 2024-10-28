import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Screens/HomeScreen/HomeScreen.dart';
import 'package:mamaiknow/Screens/Trackers/PeriodTracker/PeriodTracker.dart';
import 'package:mamaiknow/Screens/Trackers/TrackerScreen.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PeriodTrackerScreen(),
      HomeScreen(),
      HomeScreen(),
      Container(),
    ];
    return Scaffold(
      key: scaffoldKey,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          backgroundColor: AppColors.kSecondary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.home,
                color:
                    _selectedIndex == 0 ? AppColors.kPrimary : AppColors.kWhite,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.guideline,
                color:
                    _selectedIndex == 1 ? AppColors.kPrimary : AppColors.kWhite,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.heart,
                color:
                    _selectedIndex == 2 ? AppColors.kPrimary : AppColors.kWhite,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppIcons.profile,
                color:
                    _selectedIndex == 4 ? AppColors.kPrimary : AppColors.kWhite,
              ),
              label: '',
            ),
          ]),
    );
  }
}
