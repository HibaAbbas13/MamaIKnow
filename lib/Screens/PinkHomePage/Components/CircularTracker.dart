import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mamaiknow/Data/AppColors.dart';

import 'package:mamaiknow/Data/AppTypography.dart';

class CircularTracker extends StatelessWidget {
  final DateTime currentDate;
  final int periodDay;
  final String svgPath;

  const CircularTracker({
    Key? key,
    required this.currentDate,
    required this.periodDay,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEEE').format(currentDate);
    String month = DateFormat('MMMM').format(currentDate);
    String year = DateFormat('y').format(currentDate);
    String date = DateFormat('d').format(currentDate);

    return Container(
      width: 240.w,
      height: 240.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.kGrey900,
        border: Border.all(
          width: 4.w,
          color: AppColors.kpink500,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFF1B5F).withOpacity(0.90),
            blurRadius: 50.r,
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
                svgPath,
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
