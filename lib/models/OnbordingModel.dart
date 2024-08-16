import 'package:mamaiknow/Data/AppAssets.dart';


class OnboardingModel {
  final String title;
  final String subtitle;
  final String image;
  final bool hasSignUpSignInButtons;
  final bool
      showArrowButton; // New property to choose between arrow and text button

  OnboardingModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.hasSignUpSignInButtons = false,
    this.showArrowButton =
        true, // Default to true if you want arrow button by default
  });
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
      image: AppAssets.onboarding1,
      title: 'Welcome to Mamaiknow',
      subtitle:
          'Your Comprehensive Guide to\n\tReproductive Health and Pregnancy ',
      showArrowButton: true),
  OnboardingModel(
      image: AppAssets.onboarding2,
      title: 'Explore Key Features',
      subtitle: 'Discover How MamaIKnow\n\t\tCan Support You',
      showArrowButton: true),
  OnboardingModel(
      image: AppAssets.onboarding3,
      title: 'Get Started with MamaIKnow',
      subtitle: 'Ready to Begin Your Journey?',
      hasSignUpSignInButtons: true,
      showArrowButton: false),
];
