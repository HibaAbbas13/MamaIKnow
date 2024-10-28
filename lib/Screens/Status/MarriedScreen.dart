import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/CommonWidgets/CommonButton.dart';
import 'package:mamaiknow/Screens/LandingPage.dart';
import 'package:mamaiknow/Screens/Trackers/PeriodTracker/PeriodTracker.dart';
import 'package:mamaiknow/Screens/Trackers/TrackerScreen.dart';

class UnMarriedScreen extends StatefulWidget {
  const UnMarriedScreen({super.key});

  @override
  State<UnMarriedScreen> createState() => _UnMarriedScreenState();
}

class _UnMarriedScreenState extends State<UnMarriedScreen> {
  String? selectedDay;
  DateTime? selectedDate;
  String? periodDuration;

  Future<void> _selectDate(BuildContext context) async {
    final colorScheme = Theme.of(context).colorScheme;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      helpText: 'Select Last Period Date',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.kSecondary, // header background color
              onPrimary: colorScheme.primary, // header text color
              onSurface: colorScheme.primary, // body text color
            ),
            dialogBackgroundColor: colorScheme.primary,
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _saveToFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;

    try {
      await firestore.collection('users').doc(userId).update({
        'length_of_cycle': selectedDay,
        'last_period_date': selectedDate?.toIso8601String(),
        'period_duration': periodDuration,
      });
      Get.snackbar("Success", "Data saved successfully!");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.kSecondary,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "UnMarried",
          style: AppTypography.kBold20.copyWith(color: colorScheme.primary),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: colorScheme.primary,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Length of Cycle",
                style: AppTypography.kSemiBold16
                    .copyWith(color: colorScheme.primary),
              ),
              InkWell(
                child: Container(
                  height: 48.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: colorScheme.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DropdownButton<String>(
                      iconEnabledColor: AppColors.kSecondary,
                      isExpanded: true,
                      isDense: true,
                      underline: 0.horizontalSpace,
                      dropdownColor: AppColors.kPrimary,
                      value: selectedDay,
                      items: List.generate(31, (index) {
                        final day = (index + 1).toString();
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(
                            day == '1' ? '1 day' : '$day days',
                            style: AppTypography.kLight16
                                .copyWith(color: AppColors.kSecondary),
                            selectionColor: AppColors.kSecondary,
                          ),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 30.h),
            Divider(
              color: colorScheme.primary,
            ),
            SizedBox(height: 30.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Last Period Date",
                style: AppTypography.kSemiBold16
                    .copyWith(color: colorScheme.primary),
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  height: 48.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: colorScheme.primary,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: DropdownButton<String>(
                        dropdownColor: AppColors.kSecondary,
                        icon: Icon(Icons.calendar_today,
                            size: 16, color: AppColors.kSecondary),
                        underline: 0.horizontalSpace,
                        onChanged: (value) {
                          _selectDate(context);
                        },
                        items: [],
                        hint: Text(
                          selectedDate != null
                              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                              : 'Select Date',
                          style: AppTypography.kLight16
                              .copyWith(color: AppColors.kSecondary),
                        ),
                        isExpanded: true,
                      )),
                ),
              ),
            ]),
            SizedBox(height: 30.h),
            Divider(
              color: colorScheme.primary,
            ),
            SizedBox(height: 30.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Period Duration",
                style: AppTypography.kSemiBold16
                    .copyWith(color: colorScheme.primary),
              ),
              Container(
                height: 48.h,
                width: 140.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: colorScheme.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DropdownButton<String>(
                    iconEnabledColor: AppColors.kSecondary,
                    isExpanded: true,
                    isDense: true,
                    underline: 0.horizontalSpace,
                    dropdownColor: AppColors.kPrimary,
                    value: periodDuration,
                    items: List.generate(10, (index) {
                      final day = (index + 1).toString();
                      return DropdownMenuItem<String>(
                        value: day,
                        child: Text(
                          day == '1' ? '1 day' : '$day days',
                          style: AppTypography.kLight16
                              .copyWith(color: AppColors.kSecondary),
                          selectionColor: AppColors.kSecondary,
                        ),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        periodDuration = value;
                      });
                    },
                  ),
                ),
              ),
            ]),
            SizedBox(height: 30.h),
            Divider(
              color: colorScheme.primary,
            ),
            SizedBox(height: 300.h),
            CommomButton2(
              onTap: () {
                _saveToFirestore();
                Get.to(() => LandingPageView());
              },
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
