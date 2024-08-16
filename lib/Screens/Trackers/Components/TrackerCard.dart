import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Trackers/PeriodTracker/PeriodTracker.dart';
import 'package:mamaiknow/models/TrackerModels.dart';

class TrackerCard extends StatelessWidget {
  final List<UpperCard> uppercard;

  const TrackerCard({super.key, required this.uppercard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final UpperCard data = uppercard[index];
          return InkWell(
            onTap: () {
              // Handle onTap if needed
            },
            child: Container(
              height: 193.h,
              width: 169.w,
              decoration: BoxDecoration(
                color: data.color,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.title,
                        style: AppTypography.kMedium12
                            .copyWith(color: AppColors.kWhite)),
                    SizedBox(height: 12.h),
                    Text(data.day,
                        style: AppTypography.kBold24
                            .copyWith(color: AppColors.klime)),
                    SizedBox(height: 12.h),
                    Text(data.subtitle,
                        style: AppTypography.kExtraLight14
                            .copyWith(color: AppColors.kWhite)),
                    Text(data.date,
                        style: AppTypography.kBold24
                            .copyWith(color: AppColors.klime)),
                    SizedBox(height: 17.h),
                    Text(data.type,
                        style: AppTypography.kExtraLight14
                            .copyWith(color: AppColors.kWhite)),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemCount: uppercard.length,
      ),
    );
  }
}

class TrackerCard2 extends StatelessWidget {
  final List<LowerCard> lowercard;

  const TrackerCard2({Key? key, required this.lowercard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 350.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
        ),
        itemBuilder: (context, index) {
          final LowerCard data = lowercard[index];
          return InkWell(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => PeriodTrackerScreen(),
                ),
              );
            },
            child: Container(
              height: 169.h,
              width: 169.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.ksemiTransparentGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                            color: AppColors.kGrey900,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: SvgPicture.asset(data.image),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SvgPicture.asset(
                            data.icon,
                            color: AppColors.kWhite,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 39.h),
                    Text(data.title,
                        style: AppTypography.kMedium16
                            .copyWith(color: AppColors.kWhite)),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: lowercard.length,
      ),
    );
  }
}
