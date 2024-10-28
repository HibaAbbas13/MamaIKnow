import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/HomePage_Controller.dart';

import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/CommonWidgets/CustomAppBar.dart';

import 'package:mamaiknow/Screens/HomeScreen/Components/Capsule.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/CustomHeader.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/HomeSection.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/QuickLinkCard.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/RemainderCard.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateTime _focusedDay = DateTime.now();
  final int _daysToDisplay = 30;
  final GlobalKey<HorizontalDateListState> _dateListKey = GlobalKey();

  // Initialize the controller
  final HomeController _homeController = Get.put(HomeController());

  void _handleLeftArrowTap() {
    _dateListKey.currentState?.scrollLeft();
  }

  void _handleRightArrowTap() {
    _dateListKey.currentState?.scrollRight();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.kPrimary,
              AppColors.kSecondary,
              AppColors.kPrimary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                'HOME PAGE',
                style:
                    AppTypography.kBold20.copyWith(color: AppColors.kSecondary),
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.kSecondary,
                ),
              ),
            ),
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCalendarHeader(
                          focusedDay: _focusedDay,
                          onLeftArrowTap: _handleLeftArrowTap,
                          onRightArrowTap: _handleRightArrowTap,
                        ),
                        Capsule(
                          key: _dateListKey,
                          startDate: _focusedDay,
                          days: _daysToDisplay,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        // Convert RxList to List using toList()
                        Obx(() => HomeSection(
                            cycleDataList:
                                _homeController.cycleDataList.toList())),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Upcoming Remainders",
                          style: AppTypography.kBold18
                              .copyWith(color: AppColors.kWhite),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const RemainderCard(),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          "Quick Links",
                          style: AppTypography.kBold18
                              .copyWith(color: AppColors.kWhite),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        // Convert RxList to List using toList()
                        Obx(() => QuickLinkCard(
                            quicklickcard:
                                _homeController.quicklinkCardList.toList())),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
