// registration_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamaiknow/Screens/PinkHomePage/PinkHomePage.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _lastPeriodDateController = TextEditingController();
  final _cycleLengthController = TextEditingController();
  final _periodDurationController = TextEditingController();

  void _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': _emailController.text,
        'lastPeriodDate':
            Timestamp.fromDate(DateTime.parse(_lastPeriodDateController.text)),
        'cycleLength': int.parse(_cycleLengthController.text),
        'periodDuration': int.parse(_periodDurationController.text),
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PinkHomePage(userId: userCredential.user!.uid),
        ),
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            TextField(
              controller: _lastPeriodDateController,
              decoration:
                  InputDecoration(labelText: "Last Period Date (yyyy-mm-dd)"),
            ),
            TextField(
              controller: _cycleLengthController,
              decoration: InputDecoration(labelText: "Cycle Length (days)"),
            ),
            TextField(
              controller: _periodDurationController,
              decoration: InputDecoration(labelText: "Period Duration (days)"),
            ),
            ElevatedButton(
              onPressed: _register,
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
