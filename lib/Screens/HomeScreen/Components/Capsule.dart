import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';

class Capsule extends StatefulWidget {
  final DateTime startDate;
  final int days;

  Capsule({
    Key? key,
    required this.startDate,
    this.days = 30,
  }) : super(key: key);

  @override
  HorizontalDateListState createState() => HorizontalDateListState();
}

class HorizontalDateListState extends State<Capsule> {
  final ScrollController _scrollController = ScrollController();

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 60, // Adjust value as needed
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 60, // Adjust value as needed
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 12, top: 12, right: 0),
        child: Container(
            color: Colors.transparent,
            height: 70.h,
            width: double.infinity,
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.days,
              itemBuilder: (context, index) {
                DateTime date = widget.startDate.add(Duration(days: index));
                String day = DateFormat('d').format(date);
                String weekday = DateFormat('EEE').format(date);

                return Container(
                  width: 48.w,
                  height: 68.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1e1e1e),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1A000000),
                        offset: Offset(0, 4),
                        blurRadius: 24,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weekday,
                          style: AppTypography.kExtraLight10
                              .copyWith(color: AppColors.kWhite),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          day,
                          style: AppTypography.kBold16
                              .copyWith(color: AppColors.kWhite),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 4.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color:
                                AppColors.klime, // Change the color as needed
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8.w);
              },
            )));
  }
}
