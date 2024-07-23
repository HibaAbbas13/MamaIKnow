import 'dart:ui';

class QuicklinkData {
  String image;
  String title;
  String description;
  String buttontitle;
  String icon;
  Color color1;
  Color color2;
  QuicklinkData(
      {required this.image,
      required this.title,
      required this.description,
      required this.icon,
      required this.color1,
      required this.color2,
      required this.buttontitle});
}

List<QuicklinkData> quicklink = [
  QuicklinkData(
    image: "assets/icons/Suitcase.svg",
    title: 'Hospital Bag Pack',
    description:
        'Get ready for your hospital stay with our comprehensive checklist.',
    icon: 'assets/icons/addcircle.svg',
    buttontitle: 'View Checklist',
    color2: Color(0xFF00bdff),
    color1: const Color(0xFF006b99),
  ),
  QuicklinkData(
    image: 'assets/icons/esstenialui.svg',
    title: 'Myths & Quizzes',
    description: 'Test your knowledge and debunk common pregnancy myths.',
    icon: 'assets/icons/Eye.svg',
    buttontitle: 'Take a Quiz',
    color1: const Color(0xFFff5c00),
    color2: const Color(0xFFff8b00),
  ),
  QuicklinkData(
    image: 'assets/icons/tworounded.svg',
    title: 'Postpartum Helper',
    description: 'Get support and tips for your postpartum journey.',
    icon: 'assets/icons/essentails.svg',
    buttontitle: 'Join Community',
    color1: const Color(0xFF430099),
    color2: const Color(0xFF7000ff),
  ),
];
