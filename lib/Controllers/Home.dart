
import 'dart:ui';

import 'package:get/get.dart';

import 'package:mamaiknow/Models/HomeModel.dart';
import 'package:mamaiknow/Models/QuickLinksModel.dart';

class HomeController extends GetxController {
  var cycleDataList = <CycleData>[].obs;
  var quicklinkCardList = <QuicklinkData>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with the existing data
    cycleDataList.addAll([
      CycleData(
        image: "assets/icons/Group.svg",
        title: 'Period Cycle',
        time: 'Day 12 of 28',
        name: 'Next Period',
        date: 'Aug 10',
        log: 'Log Symptomps',
        icon: 'assets/icons/calender.svg',
      ),
      CycleData(
        image: 'assets/icons/sprout-tree.svg',
        title: 'Fertility Period',
        time: 'Aug 5 - 10',
        name: 'Ovulation',
        date: 'Aug 7',
        log: 'Log Signs',
        icon: 'assets/icons/stats.svg',
      ),
      CycleData(
        image: 'assets/icons/dove.svg',
        title: 'Pregnancy\nJourney',
        time: 'Week 24',
        name: 'Baby is the size of a mango',
        date: '',
        log: 'Log Symptomps',
        icon: 'assets/icons/stats.svg',
      ),
      CycleData(
        image: 'assets/icons/hearts-heart.svg',
        title: 'Contractions\nTracker',
        time: '',
        name: 'No contractions logged',
        date: '',
        log: 'Start Timer',
        icon: 'assets/icons/time.svg',
      ),
    ]);

    quicklinkCardList.addAll([
      QuicklinkData(
        image: "assets/icons/Suitcase.svg",
        title: 'Hospital Bag Pack',
        description:
            'Get ready for your hospital stay with our comprehensive checklist.',
        icon: 'assets/icons/addcircle.svg',
        buttontitle: 'View Checklist',
        color2: Color(0xFF00bdff),
        color1: const Color(0xFF006b99),
      ),
      QuicklinkData(
        image: 'assets/icons/esstenialui.svg',
        title: 'Myths & Quizzes',
        description: 'Test your knowledge and debunk common pregnancy myths.',
        icon: 'assets/icons/Eye.svg',
        buttontitle: 'Take a Quiz',
        color1: const Color(0xFFff5c00),
        color2: const Color(0xFFff8b00),
      ),
      QuicklinkData(
        image: 'assets/icons/tworounded.svg',
        title: 'Postpartum Helper',
        description: 'Get support and tips for your postpartum journey.',
        icon: 'assets/icons/essentails.svg',
        buttontitle: 'Join Community',
        color1: const Color(0xFF430099),
        color2: const Color(0xFF7000ff),
      ),
      // Add other QuicklinkData items...
    ]);
  }
}
