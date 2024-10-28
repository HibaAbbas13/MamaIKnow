import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamaiknow/models/UserModel.dart';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  // Users.
  CollectionReference<UserModel?> get userCollection => _firestore
          .collection('users')
          .withConverter(fromFirestore: (snapshot, options) {
        return snapshot.exists ? UserModel.fromMap(snapshot.data()!) : null;
      }, toFirestore: (object, options) {
        return object!.toMap();
      });
}
