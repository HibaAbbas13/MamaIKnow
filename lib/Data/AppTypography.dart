import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static TextStyle _sfProDisplay({
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: 'SFProDisplay',
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  // Extra Light (400)
  static TextStyle kExtraLight10 =
      _sfProDisplay(fontSize: 10, fontWeight: FontWeight.w400);
  static TextStyle kExtraLight12 =
      _sfProDisplay(fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle kExtraLight14 =
      _sfProDisplay(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle kExtraLight16 =
      _sfProDisplay(fontSize: 16, fontWeight: FontWeight.w400);

  // Light (500)
  static TextStyle kLight10 =
      _sfProDisplay(fontSize: 10, fontWeight: FontWeight.w500);
  static TextStyle kLight12 =
      _sfProDisplay(fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle kLight14 =
      _sfProDisplay(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle kLight16 =
      _sfProDisplay(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle kLight18 =
      _sfProDisplay(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle kLight20 =
      _sfProDisplay(fontSize: 20, fontWeight: FontWeight.w500);

  // Medium (600)
  static TextStyle kMedium12 =
      _sfProDisplay(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle kMedium14 =
      _sfProDisplay(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle kMedium16 =
      _sfProDisplay(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle kMedium18 =
      _sfProDisplay(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle kMedium20 =
      _sfProDisplay(fontSize: 20, fontWeight: FontWeight.w600);

  // Semi Bold (600)
  static TextStyle kSemiBold12 =
      _sfProDisplay(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle kSemiBold14 =
      _sfProDisplay(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle kSemiBold16 =
      _sfProDisplay(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle kSemiBold18 =
      _sfProDisplay(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle kSemiBold20 =
      _sfProDisplay(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle kSemiBold34 =
      _sfProDisplay(fontSize: 34, fontWeight: FontWeight.w600);
  static TextStyle kSemiBold24 =
      _sfProDisplay(fontSize: 24, fontWeight: FontWeight.w600);
  // Bold (700)
  static TextStyle kBold14 =
      _sfProDisplay(fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle kBold24 =
      _sfProDisplay(fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle kBold16 =
      _sfProDisplay(fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle kBold18 =
      _sfProDisplay(fontSize: 18, fontWeight: FontWeight.w700);
  static TextStyle kBold20 =
      _sfProDisplay(fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle kBold22 =
      _sfProDisplay(fontSize: 22, fontWeight: FontWeight.w700);
  static TextStyle kBold32 =
      _sfProDisplay(fontSize: 32, fontWeight: FontWeight.w700);
  static TextStyle kBold48 =
      _sfProDisplay(fontSize: 48, fontWeight: FontWeight.w700);
  // Extra Bold (800)
  static TextStyle kExtraBold24 =
      _sfProDisplay(fontSize: 24, fontWeight: FontWeight.w800);
}
