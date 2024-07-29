class LoggingData {
  final String symptomCategory;
  final int severityScale;
  final String mood;
  final String notes;

  LoggingData({
    required this.symptomCategory,
    required this.severityScale,
    required this.mood,
    required this.notes,
  });

  Map<String, dynamic> toMap() {
    return {
      'symptomCategory': symptomCategory,
      'severityScale': severityScale,
      'mood': mood,
      'notes': notes,
    };
  }

  factory LoggingData.fromMap(Map<String, dynamic> map) {
    return LoggingData(
      symptomCategory: map['symptomCategory'],
      severityScale: map['severityScale'],
      mood: map['mood'],
      notes: map['notes'],
    );
  }
}
