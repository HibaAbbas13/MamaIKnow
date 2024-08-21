// period_tracker_provider.dartimport 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PeriodTrackerController extends GetxController {
  var nextPeriodDate = DateTime.now().obs;
  var lastPeriodDate = DateTime.now().obs;
  var cycleLength = 28.obs; // Default value
  var periodDuration = 5.obs; // Default value

  // Getters for observables
  DateTime get getNextPeriodDate => nextPeriodDate.value;
  DateTime get getLastPeriodDate => lastPeriodDate.value;
  int get getCycleLength => cycleLength.value;
  int get getPeriodDuration => periodDuration.value;

  void updatePeriodData({
    required DateTime lastPeriodDate,
    required int cycleLength,
    required int periodDuration,
  }) {
    this.lastPeriodDate.value = lastPeriodDate;
    this.cycleLength.value = cycleLength;
    this.periodDuration.value = periodDuration;
    nextPeriodDate.value = lastPeriodDate.add(Duration(days: cycleLength));
  }

  int calculatePeriodDay() {
    DateTime currentDate = DateTime.now();
    int periodDay =
        currentDate.difference(lastPeriodDate.value).inDays % cycleLength.value;
    return periodDay < 0 ? periodDay + cycleLength.value : periodDay;
  }

  void logNewPeriod() {
    lastPeriodDate.value = DateTime.now();
    nextPeriodDate.value =
        lastPeriodDate.value.add(Duration(days: cycleLength.value));
  }

  Future<void> fetchUserData(String userId) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        cycleLength.value = data['cycleLength'] ?? cycleLength.value;
        periodDuration.value = data['periodDuration'] ?? periodDuration.value;
        DateTime lastPeriodDate =
            (data['lastPeriodDate'] as Timestamp).toDate();
        updatePeriodData(
          lastPeriodDate: lastPeriodDate,
          cycleLength: cycleLength.value,
          periodDuration: periodDuration.value,
        );
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
}





class PeriodTrackerController2 extends GetxController {
  var currentDate = DateTime.now().obs;
  var periodDay = 0.obs;

  void updateCurrentDate(DateTime newDate) {
    currentDate.value = newDate;
  }

  void updatePeriodDay(int newPeriodDay) {
    periodDay.value = newPeriodDay;
  }
}
