import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                color: color2,
              )),
            )));
  }
}
