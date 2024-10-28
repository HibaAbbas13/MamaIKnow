import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

class MoodLoggingWidget extends StatelessWidget {
  final String selectedMood;
  final TextEditingController notesController;
  final ValueChanged<String?> onMoodChanged;

  const MoodLoggingWidget({
    super.key,
    required this.selectedMood,
    required this.notesController,
    required this.onMoodChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Define a list of moods and their corresponding emojis
    final moods = [
      '😊',
      '😢',
      '😐',
      '😠',
      '😃',
      '😟',
      '😒',
      '😕',
      '😌',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: moods.map((mood) {
            return GestureDetector(
              onTap: () => onMoodChanged(mood), // Update mood on tap
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    mood, // Emoji
                    style: TextStyle(
                      fontSize: 20, // Adjust size as needed
                      color: selectedMood == mood
                          ? AppColors.kPrimary // Highlight selected mood
                          : AppColors.kSecondary,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: notesController,
          decoration: InputDecoration(
            fillColor: AppColors.kPrimary,
            hintText: 'Add Notes',
            hintStyle: AppTypography.kSemiBold18.copyWith(
              color: AppColors.kSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
