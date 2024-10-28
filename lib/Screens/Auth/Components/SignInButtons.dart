import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';

import 'package:mamaiknow/Data/AppIcons.dart';

class SignInButtons extends StatelessWidget {
  SignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            // controller.signInWithGoogle();
          },
          child: Container(
              height: 64.h,
              width: 64.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: colorScheme.primary),

                //  color: colorScheme.tertiaryContainer
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(AppIcons.google,
                    height: 30.h, width: 20.w),
              )),
        ),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: () {
            //     controller.signInWithApple();
          },
          child: Container(
              height: 64.h,
              width: 64.w,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: colorScheme.primary),
                shape: BoxShape.circle,
                // color: colorScheme.tertiaryContainer
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  AppIcons.apple,
                  color: AppColors.kBlack,
                  height: 30.h,
                  width: 20.w,
                ),
              )),
        ),
      ],
    );
  }
}
