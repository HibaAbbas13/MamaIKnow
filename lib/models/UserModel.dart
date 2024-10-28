// user_model.dart
import 'dart:convert';

class UserModel {
  String id;
  String email;
  String? name;
  DateTime? lastPeriodDate;
  int? cycleLength;
  int? periodDuration;

  UserModel({
    required this.id,
    required this.email,
    required this.lastPeriodDate,
    required this.cycleLength,
    required this.periodDuration,
    required String name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'last_period_date': lastPeriodDate,
      'cycle_length': cycleLength,
      'period_duration': periodDuration,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      lastPeriodDate: map['last_period_date'],
      cycleLength: map['cycle_length'],
      periodDuration: map['period_duration'],
    );
  }

  String toJson() => jsonEncode(toMap());
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
