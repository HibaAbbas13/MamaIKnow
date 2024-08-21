import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppIcons.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final Color circleColor;
  final VoidCallback? onNotificationIconPressed;

  CustomAppBar({
    required this.title,
    required this.subtitle,
    this.onNotificationIconPressed,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          Colors.transparent, // Use theme color for the app bar background

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.kSemiBold12.copyWith(color: AppColors.kWhite),
          ),
          Text(
            subtitle,
            style: AppTypography.kSemiBold20.copyWith(color: AppColors.kWhite),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
                color: circleColor, // Background color for visibility
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                AppIcons.notification,
                color: AppColors.kBlack,
              ),
            ),
          ),
          onPressed: onNotificationIconPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  // Adjust height as needed
}
