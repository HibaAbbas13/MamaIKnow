import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mamaiknow/Controllers/Authfiled_Controller.dart';
import 'package:mamaiknow/Controllers/user_controller.dart';
import 'package:mamaiknow/Screens/Auth/SignInScreen.dart';
import 'package:mamaiknow/Services/database_service.dart';
import 'package:mamaiknow/models/UserModel.dart';
import 'package:mamaiknow/utils/apputils.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final db = DatabaseService();

  final _auth = FirebaseAuth.instance;
  AuthController get controller => Get.find<AuthController>();
  UserController get userController => Get.find<UserController>();

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    callFutureFunctionWithLoadingOverlay(
      asyncFunction: () async {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        _handleAuthStateLoader();
        Get.back();
      },
    );
  }

  void _handleAuthStateLoader() {
    Get.put(UserController(), permanent: true);
  }

  Future<void> resetPassword({required String email}) async {
    callFutureFunctionWithLoadingOverlay(
      asyncFunction: () async {
        await _auth.sendPasswordResetEmail(email: email);
        Fluttertoast.showToast(msg: 'Password Reset Mail Sent');
        Get.back();
      },
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String emailAddress,
    required String password,
    bool isFromWelcome = false,
  }) async {
    callFutureFunctionWithLoadingOverlay(
      asyncFunction: () async {
        final cred = await _auth.createUserWithEmailAndPassword(
            email: emailAddress, password: password);
        await _createUserInFirestore(user: cred.user!);
        _handleAuthStateLoader();
        if (isFromWelcome) {
          Get.back();
        } else {
          Get.close(2);
        }
      },
    );
  }

  Future<void> signInWithGoogle({bool isFromSignIn = true}) async {
    callFutureFunctionWithLoadingOverlay(
      asyncFunction: () async {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser != null) {
          final GoogleSignInAuthentication googleAuth =
              await googleUser.authentication;

          OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          UserCredential result = await _auth.signInWithCredential(credential);
          User? user = result.user;

          if (user != null) {
            if (result.additionalUserInfo!.isNewUser) {
              await _createUserInFirestore(user: user);
            }
            if (isFromSignIn) {
              Get.back();
            } else {
              Get.close(2);
            }
          } else {
            Fluttertoast.showToast(
                msg: "Something went wrong, please try again");
            return;
          }
        }
      },
    );
  }

  Future<void> signInWithApple({bool isFromSignIn = true}) async {
    callFutureFunctionWithLoadingOverlay(
      asyncFunction: () async {
        final rawNonce = AppUtils.generateNonce();
        final nonce = AppUtils.sha256ofString(rawNonce);
        final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          nonce: nonce,
        );
        final oauthCredential = OAuthProvider("apple.com").credential(
          idToken: appleCredential.identityToken,
          rawNonce: rawNonce,
        );
        final userCredentials =
            await _auth.signInWithCredential(oauthCredential);
        final user = userCredentials.user;
        if (user != null) {
          if (userCredentials.additionalUserInfo!.isNewUser) {
            await _createUserInFirestore(
              user: user,
            );
          }
          if (!isFromSignIn) {
            Get.back();
          }
        } else {
          Fluttertoast.showToast(msg: "Something went wrong, please try again");
          return;
        }
      },
    );
  }

  Future<void> _createUserInFirestore({
    required User user,
    DateTime? lastPeriodDate,
    int? cycleLength,
    int? periodDuration,
  }) async {
    log("Creating user in Firestore: ${user.email}");

    // Check if the user already exists in Firestore.
    final userDoc = await db.userCollection.doc(user.uid).get();

    if (!userDoc.exists) {
      final newUser = UserModel(
        id: user.uid,
        email: user.email ?? 'no-email@example.com',
        name: user.displayName ?? 'Anonymous',
        lastPeriodDate: lastPeriodDate,
        cycleLength: cycleLength,
        periodDuration: periodDuration,
      );

      // Save the new user to Firestore.
      await db.userCollection.doc(user.uid).set(newUser);
      log("User created successfully: ${newUser.email}");
    } else {
      log("User already exists: ${user.email}");
    }
  }

  Future<void> signOut() async {
    callFutureFunctionWithLoadingOverlay(
      asyncFunction: () async {
        await _auth.signOut();
        await GoogleSignIn().signOut();
        Get.delete<UserController>(force: true);
        Get.delete<AuthController>(force: true);
        Get.offAll(() => const SignInScreen());
      },
    );
  }
}
