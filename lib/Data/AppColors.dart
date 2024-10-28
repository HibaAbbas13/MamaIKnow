import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static Color kPrimary = const Color(0XFFCA7CD8);
  static Color kSecondary = const Color(0XFFF4E5F7);
  static Color kBackGroundColor = const Color(0XFF2D3047);
  static Color kLightAccentColor = const Color(0XFFF4E5F7);
  static Color kGrey3Color = const Color(0XFF272828);
  static Color kBGColor = const Color(0XFF181A1A);
  static Color kBlackColor = const Color(0XFF000000);
  static Color kWhiteColor = const Color(0XFFFFFFFF);

  // Primary pink color
  static Color kWhite = const Color(0xFFFFFFFF);
  static Color kBlack = const Color(0xFF000000);
  static Color kPinkLight =
      const Color(0xFFFFC1D1); // Light pink for backgrounds
  static Color kPinkDark = const Color(0xFFFF1A5F); // Darker pink for accents

  static const defaultOverlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}
