import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/models/HomeModel.dart';

class HomeSection extends StatefulWidget {
  final List<CycleData> cycleDataList;
  HomeSection({super.key, required this.cycleDataList});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
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
                //  color: AppColors.kGrey900,
                gradient: LinearGradient(
                  colors: [
                    AppColors.kGrey02,
                    AppColors.kGrey01,
                    AppColors.klime,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.kGrey02,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset(
                          data.image,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(data.title,
                        style: AppTypography.kMedium16
                            .copyWith(color: AppColors.kWhite)),
                  ]),
                  SizedBox(height: 20.h),
                  Text(data.time,
                      style: AppTypography.kExtraBold24
                          .copyWith(color: AppColors.klime)),
                  SizedBox(height: 20.h),
                  Text(data.name,
                      style: AppTypography.kExtraLight12
                          .copyWith(color: AppColors.kWhite)),
                  Text(data.date,
                      style: AppTypography.kExtraBold24
                          .copyWith(color: AppColors.klime)),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 142.w,
                        decoration: BoxDecoration(
                          color: AppColors.klime,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Center(
                            child: Text(
                              data.log,
                              style: AppTypography.kSemiBold14
                                  .copyWith(color: AppColors.kBlack),
                            ),
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
                          padding: const EdgeInsets.all(13.0),
                          child: SvgPicture.asset(
                            data.icon,
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
          return SizedBox(width: 12.w);
        },
        itemCount: widget.cycleDataList.length,
      ),
    );
  }
}
