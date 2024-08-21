import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mamaiknow/Screens/Auth/Components/Validation.dart';
import 'package:mamaiknow/Screens/HomeScreen/HomeScreen.dart';
import 'package:mamaiknow/Screens/Status/StatusScreen.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method for manual sign-in with email and password
  void signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        // Perform sign-in
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // Check the user's status in Firestore
        final userId = userCredential.user!.uid;
        final userDoc = await _firestore.collection('users').doc(userId).get();
        final userData = userDoc.data();
        final status = userData?['status'];

        if (status == null || status == 'Not Set') {
        
          Get.to(() => const Statusscreen());
        } else {
        
          Get.to(() => HomeScreen());
        }
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
  }

  // Method for Google sign-in
  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      Get.snackbar("Success", "Signed in with Google successfully!");
      Get.offAll(Statusscreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // Method for Apple sign-in
  void signInWithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final authCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );

      await _auth.signInWithCredential(authCredential);
      Get.snackbar("Success", "Signed in with Apple successfully!");
      Get.offAll(Statusscreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
class SignUpController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? selectedDay;
  DateTime? selectedDate;
  String? periodDuration;

  void signUp() async {
    if (formKey.currentState!.validate()) {
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      final passwordValidation = CustomValidator.validatePassword(password);
      final confirmPasswordValidation =
          CustomValidator.validateConfirmPassword(confirmPassword, password);

      if (passwordValidation == null && confirmPasswordValidation == null) {
        try {
          // Perform signup logic here, e.g., create user with Firebase Auth
          final userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: password,
          );

          // Add user data to Firestore
          await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'email': emailController.text,
            'password': passwordController.text,
            'status': 'Not Set', // Default status, to be updated later
            'length_of_cycle': selectedDay,
            'last_period_date': selectedDate?.toIso8601String(),
            'period_duration': periodDuration,
          });

          // Navigate to Statusscreen
          Get.to(() => const Statusscreen());
        } catch (e) {
          // Handle signup error
          Get.snackbar("Error", e.toString());
        }
      } else {
        // Handle validation errors
        Get.snackbar(
            "Error", passwordValidation ?? confirmPasswordValidation ?? "");
      }
    }
  }
}