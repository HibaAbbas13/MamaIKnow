import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/Components/CommonButton.dart';

class RemainderCard extends StatelessWidget {
  const RemainderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 164.h,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 12.w,
                ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 240.w,
                height: 164.h,
                padding: const EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.kGrey900),
                child: Column(
                  children: [
                    Text(
                      "Log your daily symptoms",
                      style: AppTypography.kSemiBold12
                          .copyWith(color: AppColors.kWhite),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "10:00 AM",
                      style: AppTypography.kSemiBold24
                          .copyWith(color: AppColors.kWhite),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          CommomButton(
                              color: AppColors.kpink500,
                              color2: AppColors.kWhite,
                              onTap: () {},
                              width: 96.w,
                              height: 40.h,
                              icon: "assets/icons/alarmsleep.svg"),
                          SizedBox(
                            width: 8.w,
                          ),
                          CommomButton(
                              color: AppColors.klime,
                              color2: AppColors.kBlack,
                              onTap: () {},
                              width: 96.w,
                              height: 40.h,
                              icon: "assets/icons/checkcircle.svg")
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
