import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Components/CustomAppBar.dart';

import 'package:mamaiknow/Screens/HomeScreen/Components/CustomHeader.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/HomeSection.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/Capsule.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/QuickLinkCard.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/RemainderCard.dart';
import 'package:mamaiknow/models/HomeModel.dart';
import 'package:mamaiknow/models/QuickLinksModel.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final DateTime _focusedDay = DateTime.now();
  final int _daysToDisplay = 30;
  final GlobalKey<HorizontalDateListState> _dateListKey = GlobalKey();

  HomeScreen({super.key});

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
              AppColors.kGrey900,
              AppColors.klime,
              AppColors.kGrey900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              title: 'Hello,',
              subtitle: 'Defia Yoe',
              circleColor: AppColors.klime,
            ),
            body: Container(
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

                      HomeSection(cycleDataList: cycledata),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Upcoming Remainders",
                        style: AppTypography.kSemiBold16
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
                        style: AppTypography.kSemiBold16
                            .copyWith(color: AppColors.kWhite),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      QuickLinkCard(quicklickcard: quicklink)
                      //UpcomingReminders(),
                      //QuickLinks(),
                    ],
                  ),
                ),
              ),
            )));
  }
}
