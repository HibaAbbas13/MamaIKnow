import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static Color kPrimary = Color.fromARGB(0, 255, 27, 95);

  static Color kWhite = const Color(0xFFFFFFFF);
  static Color kBlack = const Color(0xFF000000);

  static Color kGrey900 = const Color(0xFF1e1e1e);
  static Color kblueGrey = const Color(0xFF2f2f2f);
  static Color kGrey01 = const Color(0XFF111111);
  static Color kGrey02 = const Color(0xFF181818);

  static Color kRed = const Color(0xFFFF002D);
  static Color kblue = const Color(0xFF00bdff);
  static Color kblue900 = const Color(0xFF006b99);
  static Color korange = const Color(0xFFff5b00);
  static Color kpink500 = const Color(0xFFff1a5f);
  static Color kpink = const Color(0xFF990f39);
  static Color kpurple = const Color(0xFF430099);
  static Color kdeeppurple = const Color(0xFF7000ff);
  static Color klime = const Color(0xFFD1FF1B);

  static const defaultOverlay = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );
}
