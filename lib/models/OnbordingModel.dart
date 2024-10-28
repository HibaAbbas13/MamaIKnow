import 'package:mamaiknow/Data/AppAssets.dart';

class OnboardingModel {
  final String title;
  final String subtitle;
  final String image;

  final bool
      showArrowButton; // New property to choose between arrow and text button

  OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.showArrowButton =
        true, // Default to true if you want arrow button by default
  });
}

List<OnboardingModel> pageViewList = [
  OnboardingModel(
      image: AppAssets.onboarding6,
      title: 'Welcome to Mamaiknow',
      subtitle:
          'Your Comprehensive Guide to Reproductive Health and Pregnancy ',
      showArrowButton: true),
  OnboardingModel(
      image: AppAssets.onboarding7,
      title: 'Explore Key Features',
      subtitle: 'Discover How MamaIKnow Can Support You',
      showArrowButton: true),
  OnboardingModel(
      image: AppAssets.onboarding8,
      title: 'Get Started with MamaIKnow',
      subtitle: 'Ready to Begin Your Journey?',
      showArrowButton: false),
];
