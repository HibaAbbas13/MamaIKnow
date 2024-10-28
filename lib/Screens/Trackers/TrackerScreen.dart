import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mamaiknow/Controllers/TrackerCard_Controller.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

import 'package:mamaiknow/Screens/Trackers/Components/TrackerCard.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final trackerCardController = Get.find<TrackerCardController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.kPrimary,
              AppColors.kSecondary,
              AppColors.kPrimary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Trackers',
                style: AppTypography.kBold24.copyWith(color: AppColors.kWhite)),
            centerTitle: false,
          ),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A000000),
                    offset: Offset(0, 4),
                    blurRadius: 24,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Wrap TrackerCard in Obx
                      Obx(() {
                        return TrackerCard(
                            uppercard: Get.find<TrackerCardController>()
                                .upperCards
                                .toList());
                      }),
                      SizedBox(height: 20.h),
                      Obx(() {
                        return TrackerCard2(
                            lowercard: Get.find<TrackerCardController>()
                                .lowerCards
                                .toList());
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
