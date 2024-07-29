import 'package:flutter/material.dart';
import 'package:mamaiknow/Providers/Logging.dart';
import 'package:mamaiknow/Screens/Trackers/PeriodTracker/Components/Calender.dart';
import 'package:mamaiknow/Screens/Trackers/PeriodTracker/Components/MoodLogging.dart';
import 'package:mamaiknow/Screens/Trackers/PeriodTracker/Components/SymptomLogging.dart';
import 'package:mamaiknow/models/LoggingModel.dart';
import 'package:provider/provider.dart';


class PeriodTrackerScreen extends StatefulWidget {
  @override
  _PeriodTrackerScreenState createState() => _PeriodTrackerScreenState();
}

class _PeriodTrackerScreenState extends State<PeriodTrackerScreen> {
  String _selectedSymptom = 'Cramps';
  int _selectedSeverity = 3;
  String _selectedMood = 'Happy';
  TextEditingController _notesController = TextEditingController();
  DateTime? _selectedDate;

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoggingProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Period Cycle Tracker'),
        ),
        body: Consumer<LoggingProvider>(
          builder: (context, loggingProvider, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CalendarWidget(
                    onDateChanged: _onDateChanged,
                  ),
                  SizedBox(height: 20),
                  SymptomLoggingWidget(
                    selectedSymptom: _selectedSymptom,
                    selectedSeverity: _selectedSeverity,
                    onSymptomChanged: (value) {
                      setState(() {
                        _selectedSymptom = value!;
                      });
                    },
                    onSeverityChanged: (value) {
                      setState(() {
                        _selectedSeverity = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  MoodLoggingWidget(
                    selectedMood: _selectedMood,
                    notesController: _notesController,
                    onMoodChanged: (value) {
                      setState(() {
                        _selectedMood = value!;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final data = LoggingData(
                        symptomCategory: _selectedSymptom,
                        severityScale: _selectedSeverity,
                        mood: _selectedMood,
                        notes: _notesController.text,
                      );
                      loggingProvider.addLoggingData(data);
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
