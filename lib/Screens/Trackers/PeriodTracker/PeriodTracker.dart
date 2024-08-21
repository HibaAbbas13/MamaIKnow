import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart'; // Make sure to add this dependency to your pubspec.yaml

class PeriodTrackerScreen extends StatefulWidget {
  const PeriodTrackerScreen({super.key});

  @override
  _PeriodTrackerScreenState createState() => _PeriodTrackerScreenState();
}

class _PeriodTrackerScreenState extends State<PeriodTrackerScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Map<DateTime, List<dynamic>> _events = {};

  DateTime? _nextPeriodDate;
  String? _lengthOfCycle;
  DateTime? _lastPeriodDate;
  String? _periodDuration;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        title: Text("Period Tracker", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(color: Colors.white),
                selectedTextStyle: TextStyle(color: Colors.black),
                outsideTextStyle: TextStyle(color: Colors.grey),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon:
                    Icon(Icons.chevron_right, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Estimated Next Period Date: ${_nextPeriodDate != null ? DateFormat('MM/dd/yyyy').format(_nextPeriodDate!) : 'N/A'}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
