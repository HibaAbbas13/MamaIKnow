import 'package:flutter/material.dart';

import 'package:mamaiknow/Data/AppColors.dart';

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
          AppColors.kSecondary, // Use theme color for the app bar background

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                AppTypography.kSemiBold12.copyWith(color: AppColors.kPrimary),
          ),
          Text(
            subtitle,
            style:
                AppTypography.kSemiBold20.copyWith(color: AppColors.kPrimary),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  // Adjust height as needed
}
