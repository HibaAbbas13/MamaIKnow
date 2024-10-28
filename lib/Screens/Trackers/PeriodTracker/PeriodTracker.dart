import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Data/AppTypography.dart';
import 'package:mamaiknow/Screens/CommonWidgets/CommonButton.dart';
import 'package:table_calendar/table_calendar.dart'; // Make sure to add this dependency to your pubspec.yaml
import 'Components/MoodLogging.dart'; // Import MoodLoggingWidget
import 'Components/SymptomLogging.dart'; // Import SymptomLoggingWidget

class PeriodTrackerScreen extends StatefulWidget {
  const PeriodTrackerScreen({super.key});

  @override
  _PeriodTrackerScreenState createState() => _PeriodTrackerScreenState();
}

class _PeriodTrackerScreenState extends State<PeriodTrackerScreen> {
  // Firestore and Auth instances
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // State variables
  Map<DateTime, List<dynamic>> _events = {};
  DateTime? _nextPeriodDate;
  String? _lengthOfCycle;
  DateTime? _lastPeriodDate;
  String? _periodDuration;

  // Controllers and selected values for mood and symptoms
  final TextEditingController moodNotesController = TextEditingController();
  String selectedMood = 'Happy'; // Default mood
  String selectedSymptom = 'Cramps'; // Default symptom
  int selectedSeverity = 1; // Default severity

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      try {
        final userDoc = await _firestore.collection('users').doc(userId).get();
        final userData = userDoc.data();
        _lengthOfCycle = userData?['length_of_cycle'];
        _lastPeriodDate = userData?['last_period_date'] != null
            ? DateTime.parse(userData!['last_period_date'])
            : null;
        _periodDuration = userData?['period_duration'];

        if (_lastPeriodDate != null &&
            _lengthOfCycle != null &&
            _periodDuration != null) {
          _calculateNextPeriodDate();
          _fetchPeriodEvents();
        }
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  void _calculateNextPeriodDate() {
    if (_lastPeriodDate != null && _lengthOfCycle != null) {
      final lengthOfCycle = int.parse(_lengthOfCycle!);
      _nextPeriodDate = _lastPeriodDate!.add(Duration(days: lengthOfCycle));
    }
  }

  Future<void> _fetchPeriodEvents() async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      try {
        final snapshot = await _firestore
            .collection('users')
            .doc(userId)
            .collection('period_dates')
            .get();

        final events = <DateTime, List<dynamic>>{};
        for (var doc in snapshot.docs) {
          final data = doc.data();
          final date = (data['date'] as Timestamp).toDate();
          final isPeriodDate = data['is_period_date'] as bool;

          if (isPeriodDate) {
            if (!events.containsKey(date)) {
              events[date] = [];
            }
            events[date]!.add('Period');
          }
        }

        setState(() {
          _events = events;
        });
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  Future<void> _saveMoodLog() async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      try {
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('mood_logs')
            .add({
          'mood': selectedMood,
          'notes': moodNotesController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
        Get.snackbar("Success", "Mood log saved successfully!");
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  Future<void> _saveSymptomLog() async {
    final userId = _auth.currentUser?.uid;
    if (userId != null) {
      try {
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('symptom_logs')
            .add({
          'symptom': selectedSymptom,
          'severity': selectedSeverity,
          'timestamp': FieldValue.serverTimestamp(),
        });
        Get.snackbar("Success", "Symptom log saved successfully!");
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondary,
      appBar: AppBar(
        backgroundColor: AppColors.kSecondary,
        centerTitle: true,
        title: Text("Period Tracker",
            style: AppTypography.kBold18.copyWith(color: AppColors.kPrimary)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.kPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Allow scrolling if content overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2000),
                lastDay: DateTime.utc(2100),
                focusedDay: DateTime.now(),
                selectedDayPredicate: (day) {
                  return _events.containsKey(day);
                },
                eventLoader: (day) {
                  return _events[day] ?? [];
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: AppColors.kPinkLight,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.kLightAccentColor,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(color: AppColors.kPrimary),
                  selectedTextStyle: TextStyle(color: AppColors.kPrimary),
                  outsideTextStyle: TextStyle(color: AppColors.kPrimary),
                  weekendTextStyle: TextStyle(color: AppColors.kPrimary),
                  defaultTextStyle: TextStyle(color: AppColors.kPrimary),
                  weekNumberTextStyle: TextStyle(color: AppColors.kPrimary),
                  outsideDaysVisible: false,
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle: AppTypography.kBold18.copyWith(
                      color: AppColors.kPrimary, fontWeight: FontWeight.bold),
                  titleCentered: true,
                  leftChevronIcon:
                      Icon(Icons.chevron_left, color: AppColors.kPrimary),
                  rightChevronIcon:
                      Icon(Icons.chevron_right, color: AppColors.kPrimary),
                ),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    // Red dot for previous period dates (stored in _events)
                    if (_events.containsKey(date)) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.red, // Red dot for last period dates
                          shape: BoxShape.circle,
                        ),
                        width: 8.0,
                        height: 8.0,
                      );
                    }

                    // Green dot for estimated next period date
                    if (_nextPeriodDate != null && date == _nextPeriodDate) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.green, // Green dot for next period date
                          shape: BoxShape.circle,
                        ),
                        width: 8.0,
                        height: 8.0,
                      );
                    }

                    return SizedBox(); // Return an empty widget if no markers
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Estimated Next Period Date: ${_nextPeriodDate != null ? DateFormat('MM/dd/yyyy').format(_nextPeriodDate!) : 'N/A'}',
                style: TextStyle(color: AppColors.kPrimary, fontSize: 16),
              ),
              SizedBox(height: 20.h),

              // Symptom Logging Card
              Card(
                color: AppColors.kSecondary,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Symptom Logging',
                        style: AppTypography.kBold18
                            .copyWith(color: AppColors.kPrimary),
                      ),
                      SizedBox(height: 5.h),
                      SymptomLoggingWidget(
                        selectedSymptom: selectedSymptom,
                        selectedSeverity: selectedSeverity,
                        onSymptomChanged: (newSymptom) {
                          setState(() {
                            selectedSymptom = newSymptom ?? selectedSymptom;
                          });
                        },
                        onSeverityChanged: (newSeverity) {
                          setState(() {
                            selectedSeverity = newSeverity;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                color: AppColors.kSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mood Logging',
                        style: AppTypography.kBold18
                            .copyWith(color: AppColors.kPrimary),
                      ),
                      SizedBox(height: 5.h),
                      MoodLoggingWidget(
                        selectedMood: selectedMood,
                        notesController: moodNotesController,
                        onMoodChanged: (newMood) {
                          setState(() {
                            selectedMood = newMood ?? selectedMood;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Symptom Logging Card
              SizedBox(height: 20.h),

              // Save button to log mood and symptom
              CommomButton2(
                onTap: () {
                  _saveMoodLog();
                  _saveSymptomLog();
                },
                text: 'Save Logs',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
