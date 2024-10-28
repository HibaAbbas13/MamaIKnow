import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';

class CustomSocialButtons extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  const CustomSocialButtons(
      {super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        width: 60.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            border: Border.all(color: AppColors.kPrimary, width: 1.w),
            borderRadius: BorderRadius.circular(100.r)),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
