// period_tracker_provider.dart

/*
class PeriodTrackerProvider extends ChangeNotifier {
  DateTime _nextPeriodDate = DateTime.now();
  DateTime _lastPeriodDate = DateTime.now();
  int _cycleLength = 28; // Default value
  int _periodDuration = 5; // Default value
  DateTime _currentDate = DateTime.now(); // Add current date

  DateTime get nextPeriodDate => _nextPeriodDate;
  DateTime get lastPeriodDate => _lastPeriodDate;
  int get cycleLength => _cycleLength;
  int get periodDuration => _periodDuration;
  DateTime get currentDate => _currentDate;

  void updatePeriodData({
    required DateTime lastPeriodDate,
    required int cycleLength,
    required int periodDuration,
  }) {
    _lastPeriodDate = lastPeriodDate;
    _cycleLength = cycleLength;
    _periodDuration = periodDuration;
    _nextPeriodDate = lastPeriodDate.add(Duration(days: cycleLength));
    notifyListeners();
  }

  int calculatePeriodDay() {
    int periodDay =
        _currentDate.difference(_lastPeriodDate).inDays % _cycleLength;
    return periodDay < 0 ? periodDay + _cycleLength : periodDay;
  }

  void logNewPeriod() {
    _lastPeriodDate = DateTime.now();
    _nextPeriodDate = _lastPeriodDate.add(Duration(days: _cycleLength));
    notifyListeners();
  }

  Future<void> fetchUserData(String userId) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        _cycleLength = data['cycleLength'] ?? _cycleLength;
        _periodDuration = data['periodDuration'] ?? _periodDuration;
        DateTime lastPeriodDate =
            (data['lastPeriodDate'] as Timestamp).toDate();
        updatePeriodData(
          lastPeriodDate: lastPeriodDate,
          cycleLength: _cycleLength,
          periodDuration: _periodDuration,
        );
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  void updateCurrentDate(DateTime date) {
    _currentDate = date;
    notifyListeners();
  }
}
*/