import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/CommonWidgets/CommonButton.dart';

class RemainderCard extends StatelessWidget {
  const RemainderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 180.h,
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
                    color: AppColors.kPrimary),
                child: Column(
                  children: [
                    Text(
                      "Log your daily symptoms",
                      style: AppTypography.kSemiBold16
                          .copyWith(color: AppColors.kSecondary),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "10:00 AM",
                      style: AppTypography.kSemiBold24
                          .copyWith(color: AppColors.kSecondary),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          CommomButton(
                              color: AppColors.kPrimary,
                              color2: AppColors.kSecondary,
                              onTap: () {},
                              width: 96.w,
                              height: 50.h,
                              icon: "assets/icons/alarmsleep.svg"),
                          SizedBox(
                            width: 8.w,
                          ),
                          CommomButton(
                              color: AppColors.kPrimary,
                              color2: AppColors.kSecondary,
                              onTap: () {},
                              width: 96.w,
                              height: 50.h,
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
