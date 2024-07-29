import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

import 'package:mamaiknow/Screens/Components/CustomAppBar.dart';
import 'package:mamaiknow/Screens/Trackers/Components/TrackerCard.dart';
import 'package:mamaiknow/models/TrackerModels.dart';

// ignore: must_be_immutable
class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.kGrey900,
              AppColors.klime,
              AppColors.kGrey900,
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
                  style:
                      AppTypography.kBold24.copyWith(color: AppColors.kWhite)),
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
                        TrackerCard(
                          uppercard: uppercardlist,
                        ),
                        SizedBox(height: 20.h),
                        TrackerCard2(lowercard: lowercardlist)
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
