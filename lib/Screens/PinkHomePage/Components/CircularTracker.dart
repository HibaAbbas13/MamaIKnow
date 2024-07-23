import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

class CircularTracker extends StatelessWidget {
  final DateTime currentDate;

  final int periodDay;
  final String svgPath;

  CircularTracker({
    Key? key,
    required this.currentDate,
    required this.periodDay,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEEE').format(currentDate); // Day of the week
    String month = DateFormat('MMMM').format(currentDate); // Full month name
    String year = DateFormat('y').format(currentDate); // Year
    String date = DateFormat('d').format(currentDate); // Date

    return Container(
      width: 240.w, // Adjust width and height as needed
      height: 240.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.kGrey900, // Semi-transparent black background
        border: Border.all(
          width: 4.w,
          color: AppColors.kpink500, // Border is transparent to use gradient
        ),

        boxShadow: [
          BoxShadow(
            color: Color(
              0xFFFF1B5F,
            ).withOpacity(0.90),
            blurRadius: 50.r,
            // offset: Offset(15, 25),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Text(
                  '$day, $month $date, $year',
                  style: AppTypography.kExtraLight12
                      .copyWith(color: AppColors.kpink500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Period',
                style:
                    AppTypography.kMedium16.copyWith(color: AppColors.kWhite),
              ),
              Text(
                'Day $periodDay',
                style: AppTypography.kBold48.copyWith(color: AppColors.kWhite),
              ),
            ],
          ),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: AppColors.kpink500,
                borderRadius: BorderRadius.circular(100.r)),
            child: Padding(
              padding: const EdgeInsets.all(11.4),
              child: SvgPicture.asset(
                AppIcons.guideline,
                color: AppColors.kWhite,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
