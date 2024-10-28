import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

class SymptomLoggingWidget extends StatelessWidget {
  final String selectedSymptom;
  final int selectedSeverity;
  final ValueChanged<String?> onSymptomChanged;
  final ValueChanged<int> onSeverityChanged;

  const SymptomLoggingWidget({
    super.key,
    required this.selectedSymptom,
    required this.selectedSeverity,
    required this.onSymptomChanged,
    required this.onSeverityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Symptom category',
              style: AppTypography.kSemiBold18.copyWith(
                color: AppColors.kPrimary,
              ),
            ),
            DropdownButton<String>(
              dropdownColor: AppColors.kSecondary,
              iconEnabledColor: AppColors.kPrimary,
              iconDisabledColor: AppColors.kPrimary,
              value: selectedSymptom,
              items: ['Cramps', 'Headache', 'Nausea']
                  .map((symptom) => DropdownMenuItem<String>(
                        value: symptom,
                        child: Text(symptom,
                            style: AppTypography.kSemiBold16.copyWith(
                              color: AppColors.kPrimary,
                            )),
                      ))
                  .toList(),
              onChanged: onSymptomChanged,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: List.generate(6, (index) {
            return GestureDetector(
              onTap: () => onSeverityChanged(index + 1),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.all(8),
                color: index + 1 == selectedSeverity
                    ? AppColors.kPrimary
                    : AppColors.kLightAccentColor,
                child: Text(
                  (index + 1).toString(),
                  style: AppTypography.kSemiBold18.copyWith(
                    color: index + 1 == selectedSeverity
                        ? Colors.white
                        : AppColors.kPrimary,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
