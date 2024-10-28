import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

class CustomCalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;

  const CustomCalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final month = focusedDay.month;
    final year = focusedDay.year;
    final monthName = _getMonthName(month);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: SvgPicture.asset(AppIcons.backarrow),
          onPressed: onLeftArrowTap,
        ),
        Text(
          '$monthName $year',
          style: AppTypography.kBold20.copyWith(color: AppColors.kSecondary),
        ),
        IconButton(
          icon: SvgPicture.asset(AppIcons.arrow),
          onPressed: onRightArrowTap,
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }
}
