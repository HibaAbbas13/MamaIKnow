import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

class CommomButton extends StatelessWidget {
  final String icon;
  final Color color;
  final Color color2;
  final double? width;
  final double? height;
  final VoidCallback onTap;
  //bool icon;

  const CommomButton({
    super.key,
    required this.color,
    required this.color2,
    required this.onTap,
    required this.width,
    required this.icon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r), color: color),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 36, right: 36),
              child: Center(
                  child: SvgPicture.asset(
                icon,
                height: 20.h,
                color: color2,
              )),
            )));
  }
}

class CommomButton2 extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  //bool icon;

  const CommomButton2({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 50.h,
            width: 350.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: colorScheme.primary),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 36, right: 36),
              child: Center(
                  child: Text(
                text,
                style: AppTypography.kSemiBold14
                    .copyWith(color: colorScheme.secondaryContainer),
              )),
            )));
  }
}
