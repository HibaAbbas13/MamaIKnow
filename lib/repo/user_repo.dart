import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/user_controller.dart';
import 'package:mamaiknow/Services/database_service.dart';
import 'package:mamaiknow/models/UserModel.dart';
import 'package:mamaiknow/utils/apputils.dart';

class UserRepo {
  final _db = DatabaseService();

  UserController get _uc => Get.find<UserController>();

  Future<void> updateUserNameAndProfilePicture(
      {required String name, String? image}) async {
    callFutureFunctionWithLoadingOverlay(asyncFunction: () async {
      final uid = _uc.user?.id ?? FirebaseAuth.instance.currentUser!.uid;
      _uc.user!.name = name;

      await _db.userCollection.doc(uid).set(_uc.user!, SetOptions(merge: true));
    });
  }

  Future<UserModel?> getUserById(String uid) async {
    final user = await _db.userCollection.doc(uid).get();
    return user.exists ? user.data() as UserModel : null;
  }
}
