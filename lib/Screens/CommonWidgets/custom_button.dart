import 'package:flutter/material.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomTextButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(text,
            style: AppTypography.kExtraLight12
                .copyWith(color: AppColors.kWhite.withOpacity(0.4))));
  }
}
