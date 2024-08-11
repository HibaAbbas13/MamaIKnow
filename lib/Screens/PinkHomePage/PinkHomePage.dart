import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Controllers/PeriodTracker.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
 
import 'package:mamaiknow/Screens/Components/CustomAppBar.dart';
import 'package:mamaiknow/Screens/PinkHomePage/Components/CircularTracker.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/CustomHeader.dart';
import 'package:mamaiknow/Screens/HomeScreen/Components/Capsule.dart';
import 'package:get/get.dart'; // Updated import

class PinkHomePage extends StatelessWidget {
  final String userId;

  const PinkHomePage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final PeriodTrackerController2 controller = Get.put(PeriodTrackerController2());

    // Fetch user data on initialization
    controller.updateCurrentDate(DateTime.now()); // Replace with actual fetch logic

    void _handleLeftArrowTap() {
      // Logic to scroll left
    }

    void _handleRightArrowTap() {
      // Logic to scroll right
    }

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
                  focusedDay: controller.currentDate.value,
                  onLeftArrowTap: _handleLeftArrowTap,
                  onRightArrowTap: _handleRightArrowTap,
                ),
                Capsule(
                  startDate: controller.currentDate.value,
                  days: 30, // You can replace this with dynamic value
                ),
                SizedBox(height: 40.h),
                Obx(() {
                  return CircularTracker(
                    currentDate: controller.currentDate.value,
                    periodDay: controller.periodDay.value,
                    svgPath: AppIcons.guideline,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
