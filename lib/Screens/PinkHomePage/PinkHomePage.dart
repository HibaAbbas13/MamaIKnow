import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Providers/PeriodTracker.dart';

import 'package:mamaiknow/Screens/Components/CustomAppBar.dart';
import 'package:mamaiknow/Screens/PinkHomePage/Components/CircularTracker.dart';

import 'package:mamaiknow/Screens/HomeScreen/Components/CustomHeader.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/Capsule.dart';
import 'package:provider/provider.dart';

class PinkHomePage extends StatefulWidget {
  final String userId;
  const PinkHomePage({super.key, required this.userId});

  @override
  State<PinkHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<PinkHomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PeriodTrackerProvider>(context, listen: false)
        .fetchUserData(widget.userId);
  }

  final DateTime _focusedDay = DateTime.now();
  final int _daysToDisplay = 30;
  //final int _periodDay = 4;
  final GlobalKey<HorizontalDateListState> _dateListKey = GlobalKey();

  void _handleLeftArrowTap() {
    _dateListKey.currentState?.scrollLeft();
  }

  void _handleRightArrowTap() {
    _dateListKey.currentState?.scrollRight();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PeriodTrackerProvider>(context);
    DateTime currentDate = DateTime.now();
    int periodDay = provider.calculatePeriodDay();
    return Scaffold(
      backgroundColor: AppColors.kGrey01,
      appBar: CustomAppBar(
        title: 'Hello,',
        subtitle: 'Defia Yoe',
        circleColor: AppColors.klime,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.kGrey01,
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                SizedBox(height: 40.h),
                CircularTracker(
                  currentDate: currentDate,
                  periodDay: periodDay,
                  svgPath:
                      AppIcons.guideline, // Replace with your SVG asset path
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
