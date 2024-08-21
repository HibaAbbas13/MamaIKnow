import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/CommonWidgets/CommonButton.dart';

import 'package:mamaiknow/Screens/Status/Components/CheckBox.dart';
import 'package:mamaiknow/Screens/Status/MarriedScreen.dart';

class Statusscreen extends StatefulWidget {
  const Statusscreen({super.key});

  @override
  State<Statusscreen> createState() => _StatusscreenState();
}

class _StatusscreenState extends State<Statusscreen> {
  bool isChecked1 = false;
  bool isChecked2 = true;
  int? selectedStatusIndex;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void saveToFirebase(String status) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    await _firestore.collection('users').doc(userId).update({
      'status': status,
    });
  }

  void onNext() async {
    if (selectedStatusIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a status')),
      );
      return;
    }

    String status = selectedStatusIndex == 0 ? "Married" : "UnMarried";
    saveToFirebase(status);

    Get.to(() => const UnMarriedScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ksemiTransparentGrey,
      appBar: AppBar(
        backgroundColor: AppColors.ksemiTransparentGrey,
        title: Text(
          'Status',
          style: AppTypography.kBold14.copyWith(color: AppColors.kWhite),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: Text(
                'What’s your status?',
                style:
                    AppTypography.kSemiBold16.copyWith(color: AppColors.kWhite),
              ),
            ),
            SizedBox(height: 40.h),
            CheckTab(
              title: "Married",
              isChecked: selectedStatusIndex == 0,
              onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value ?? false;
                  selectedStatusIndex = 0;
                });
              },
            ),
            SizedBox(height: 12.h),
            CheckTab(
              title: "UnMarried",
              isChecked: selectedStatusIndex == 1,
              onChanged: (bool? value) {
                setState(() {
                  isChecked2 = value ?? false;
                  selectedStatusIndex = 1;
                });
              },
            ),
            SizedBox(height: 406.h),
            CommomButton2(onTap: onNext, text: 'Next')
          ],
        ),
      ),
    );
  }
}
