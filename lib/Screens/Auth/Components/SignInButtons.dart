import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/SignInSignup_Controller.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';

class SignInButtons extends StatelessWidget {
  SignInButtons({super.key});
  final SignInController controller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            controller.signInWithGoogle();
          },
          child: Container(
              height: 64.h,
              width: 64.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.kblueGrey),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(AppIcons.google),
              )),
        ),
        SizedBox(
          width: 5.w,
        ),
        InkWell(
          onTap: () {
            controller.signInWithApple();
          },
          child: Container(
              height: 64.h,
              width: 64.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.kblueGrey),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(AppIcons.apple),
              )),
        ),
      ],
    );
  }
}
