import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to Our App",
            body: "This is the first onboarding screen.",
            image: const Icon(Icons.phone_android, size: 100, color: Colors.blue),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(fontSize: 24),
              bodyTextStyle: TextStyle(fontSize: 18),
            ),
          ),
          PageViewModel(
            title: "Security Features",
            body: "This is the second onboarding screen.",
            image: const Icon(Icons.security, size: 100, color: Colors.green),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(fontSize: 24),
              bodyTextStyle: TextStyle(fontSize: 18),
            ),
          ),
          PageViewModel(
            title: "Get Started Now",
            body: "This is the third onboarding screen.",
            image: const Icon(Icons.thumb_up, size: 100, color: Colors.orange),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(fontSize: 24),
              bodyTextStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
        onDone: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        showSkipButton: true,
       
        next: const Text('Next'),
        done: const Text('Finish', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
