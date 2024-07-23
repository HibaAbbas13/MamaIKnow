// user_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final DateTime lastPeriodDate;
  final int cycleLength;
  final int periodDuration;

  UserModel({
    required this.email,
    required this.lastPeriodDate,
    required this.cycleLength,
    required this.periodDuration,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'last_period_date': lastPeriodDate,
      'cycle_length': cycleLength,
      'period_duration': periodDuration,
    };
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      email: doc['email'],
      lastPeriodDate: (doc['last_period_date'] as Timestamp).toDate(),
      cycleLength: doc['cycle_length'],
      periodDuration: doc['period_duration'],
    );
  }
}
