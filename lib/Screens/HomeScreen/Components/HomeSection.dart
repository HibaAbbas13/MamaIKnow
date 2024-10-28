import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Models/HomeModel.dart';

class HomeSection extends StatefulWidget {
  final List<CycleData> cycleDataList;
  const HomeSection({super.key, required this.cycleDataList});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 310.h,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          CycleData data = widget.cycleDataList[index];
          return Container(
            height: 290.h,
            width: 240.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.kPrimary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.kSecondary,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset(
                          data.image,
                          color: AppColors.kPrimary,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(data.title,
                        style: AppTypography.kMedium16
                            .copyWith(color: AppColors.kSecondary)),
                  ]),
                  SizedBox(height: 20.h),
                  Text(data.time,
                      style: AppTypography.kExtraBold24
                          .copyWith(color: AppColors.kSecondary)),
                  SizedBox(height: 20.h),
                  Text(data.name,
                      style: AppTypography.kExtraLight12
                          .copyWith(color: AppColors.kSecondary)),
                  Text(data.date,
                      style: AppTypography.kExtraBold24
                          .copyWith(color: AppColors.kSecondary)),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                          color: AppColors.kSecondary,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Center(
                          child: Text(
                            data.log,
                            style: AppTypography.kSemiBold14
                                .copyWith(color: AppColors.kPrimary),
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            data.icon,
                            height: 20.h,
                            width: 20.w,
                            color: AppColors.kSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 5.w);
        },
        itemCount: widget.cycleDataList.length,
      ),
    );
  }
}
