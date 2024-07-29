import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/models/HomeModel.dart';
import 'package:mamaiknow/models/TrackerModels.dart';

class TrackerCard extends StatefulWidget {
  final List<UpperCard> uppercard;
  TrackerCard({super.key, required this.uppercard});

  @override
  State<TrackerCard> createState() => _TrackerCardState();
}

class _TrackerCardState extends State<TrackerCard> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 12),
      child: Container(
        width: double.infinity,
        height: 200.h,
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            UpperCard data = widget.uppercard[index];
            return InkWell(
              onTap: (){},
              child: Container(
                height: 193.h,
                width: 169.w,
                decoration: BoxDecoration(
                    color: data.color, borderRadius: BorderRadius.circular(20.r)),
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
                      Text(
                        data.type,
                        style: AppTypography.kExtraLight14
                            .copyWith(color: AppColors.kWhite),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 12.w);
          },
          itemCount: widget.uppercard.length,
        ),
      ),
    );
  }
}
