import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/Authfiled_Controller.dart';
import 'package:mamaiknow/Services/database_service.dart';
import 'package:mamaiknow/models/UserModel.dart';
import 'package:mamaiknow/utils/apputils.dart';

class UserController extends GetxController {
  final authController = Get.put(AuthController());
  final db = DatabaseService();
  final _currentUser = Rxn<UserModel>();
  UserModel? get user => _currentUser.value;
  String get currentUid => FirebaseAuth.instance.currentUser!.uid;

  DocumentReference get currentUserReference =>
      db.userCollection.doc(currentUid);

  Stream<UserModel?> get _currentUserStream {
    if (authController.user == null) {
      return const Stream<UserModel?>.empty();
    } else {
      return db.userCollection
          .doc(currentUid)
          .snapshots()
          .map((event) => event.data());
    }
  }

  @override
  void onInit() {
    _currentUser.bindStream(_currentUserStream);
    AppUtils.putAllControllers();
    super.onInit();
  }

  @override
  void onClose() {
    AppUtils.removeAllControllers();
    _currentUser.close();
    super.onClose();
  }
}
