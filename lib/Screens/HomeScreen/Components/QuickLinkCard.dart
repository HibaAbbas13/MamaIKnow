import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';

import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mamaiknow/Models/QuickLinksModel.dart';

class QuickLinkCard extends StatefulWidget {
  final List<QuicklinkData> quicklickcard;
  const QuickLinkCard({super.key, required this.quicklickcard});

  @override
  State<QuickLinkCard> createState() => _QuickLinkCardState();
}

class _QuickLinkCardState extends State<QuickLinkCard> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280.h,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          QuicklinkData data = widget.quicklickcard[index];
          return Container(
            height: 240.h,
            width: 240.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                //  color: AppColors.kGrey900,
                gradient: LinearGradient(
                  colors: [data.color1, data.color2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          data.image,
                          color: AppColors.kWhite,
                        ),
                        Container(
                          height: 40.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              data.icon,
                              color: AppColors.kPrimary,
                            ),
                          ),
                        ),
                      ]),
                  SizedBox(height: 12.h),
                  Text(data.title,
                      style: AppTypography.kSemiBold20
                          .copyWith(color: AppColors.kSecondary)),
                  SizedBox(height: 20.h),
                  Text(data.description,
                      style: AppTypography.kExtraLight12
                          .copyWith(color: AppColors.kSecondary)),
                  SizedBox(height: 20.h),
                  InkWell(
                      onTap: () {},
                      child: Container(
                          height: 60.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: AppColors.kWhite),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, bottom: 16.0, left: 54),
                            child: Text(
                              data.buttontitle,
                              style: AppTypography.kLight14
                                  .copyWith(color: data.color2),
                            ),
                          )))
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 12.w);
        },
        itemCount: widget.quicklickcard.length,
      ),
    );
  }
}
