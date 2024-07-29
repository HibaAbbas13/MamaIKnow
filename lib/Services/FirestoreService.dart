import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamaiknow/models/LoggingModel.dart';


class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addLoggingData(LoggingData data) async {
    await _db.collection('loggingData').add(data.toMap());
  }

  Stream<List<LoggingData>> getLoggingData() {
    return _db.collection('loggingData').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return LoggingData.fromMap(doc.data());
      }).toList();
    });
  }
}
