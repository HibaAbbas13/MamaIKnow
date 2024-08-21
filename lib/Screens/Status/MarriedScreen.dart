import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/CommonWidgets/CommonButton.dart';

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
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      helpText: 'Select Last Period Date',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.klime, // header background color
              onPrimary: AppColors.kBlack, // header text color
              onSurface: AppColors.kWhite, // body text color
            ),
            dialogBackgroundColor: AppColors.kblueGrey,
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
    return Scaffold(
      backgroundColor: AppColors.ksemiTransparentGrey,
      appBar: AppBar(
        backgroundColor: AppColors.ksemiTransparentGrey,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "UnMarried",
          style: AppTypography.kBold14.copyWith(color: AppColors.kWhite),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.kWhite,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Length of Cycle",
                style:
                    AppTypography.kSemiBold16.copyWith(color: AppColors.kWhite),
              ),
              InkWell(
                child: Container(
                  height: 48.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.kblueGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: DropdownButton<String>(
                      iconEnabledColor: AppColors.klime,
                      isExpanded: true,
                      isDense: true,
                      underline: 0.horizontalSpace,
                      dropdownColor: AppColors.kblueGrey,
                      value: selectedDay,
                      items: List.generate(31, (index) {
                        final day = (index + 1).toString();
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(
                            '$day days',
                            style: AppTypography.kLight16
                                .copyWith(color: AppColors.kWhite),
                            selectionColor: AppColors.klime,
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
              color: AppColors.kblueGrey,
            ),
            SizedBox(height: 30.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Last Period Date",
                style:
                    AppTypography.kSemiBold16.copyWith(color: AppColors.kWhite),
              ),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  height: 48.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.kblueGrey,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: DropdownButton<String>(
                        icon: Icon(Icons.calendar_today,
                            size: 16, color: AppColors.klime),
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
                              .copyWith(color: AppColors.kWhite),
                        ),
                        isExpanded: true,
                      )),
                ),
              ),
            ]),
            SizedBox(height: 30.h),
            Divider(
              color: AppColors.kblueGrey,
            ),
            SizedBox(height: 30.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Period Duration",
                style:
                    AppTypography.kSemiBold16.copyWith(color: AppColors.kWhite),
              ),
              Container(
                height: 48.h,
                width: 140.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.kblueGrey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: DropdownButton<String>(
                    iconEnabledColor: AppColors.klime,
                    isExpanded: true,
                    isDense: true,
                    underline: 0.horizontalSpace,
                    dropdownColor: AppColors.kblueGrey,
                    value: periodDuration,
                    items: List.generate(10, (index) {
                      final day = (index + 1).toString();
                      return DropdownMenuItem<String>(
                        value: day,
                        child: Text(
                          '$day days',
                          style: AppTypography.kLight16
                              .copyWith(color: AppColors.kWhite),
                          selectionColor: AppColors.klime,
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
              color: AppColors.kblueGrey,
            ),
            SizedBox(height: 300.h),
            CommomButton2(onTap: _saveToFirestore, text: 'Next')
          ],
        ),
      ),
    );
  }
}
