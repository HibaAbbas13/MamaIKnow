import 'package:flutter/material.dart';
import 'package:mamaiknow/Services/FirestoreService.dart';
import 'package:mamaiknow/models/LoggingModel.dart';

class LoggingProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> addLoggingData(LoggingData data) async {
    await _firestoreService.addLoggingData(data);
    notifyListeners();
  }

  Stream<List<LoggingData>> get loggingDataStream => _firestoreService.getLoggingData();
}
