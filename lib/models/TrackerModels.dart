import 'dart:ui';

class UpperCard {
  String day;
  String title;
  String subtitle;
  String date;
  String type;
  bool icon;
  Color color;

  UpperCard({
    required this.day,
    required this.title,
    required this.subtitle,
    this.icon = false,
    required this.type,
    required this.date,
    required this.color,
  });
}

List<UpperCard> uppercardlist = [
  UpperCard(
    day: "Day 12",
    title: 'Period',
    subtitle: 'Next Period',
    date: 'Aug 5',
    icon: true,
    color: const Color(0xFFFF002E),
    type: 'Cramps',
  ),
  UpperCard(
    day: 'Aug 5-10',
    title: 'Fertility',
    subtitle: 'Ovulation',
    date: 'Aug 7',
    color: const Color(0xFF5ede36),
    type: 'Cervical Mucus',
  ),
];

class LowerCard {
  String image;
  String title;

  String icon;

  LowerCard({
    required this.image,
    required this.title,
    required this.icon,
  });
}

List<LowerCard> lowercardlist = [
  LowerCard(
    image: "assets/icons/Group.svg",
    title: 'Period Cycle\nTracker',
    icon: 'assets/icons/essentails.svg',
  ),
  LowerCard(
    image: 'assets/icons/sprout-tree.svg',
    title: 'Fertility Period\nTracker',
    icon: 'assets/icons/essentails.svg',
  ),
  LowerCard(
    image: 'assets/icons/dove.svg',
    title: 'Pregnancy\nTracker',
    icon: 'assets/icons/essentails.svg',
  ),
  LowerCard(
    image: 'assets/icons/hearts-heart.svg',
    title: 'Contractions\nTracker',
    icon: 'assets/icons/essentails.svg',
  ),
];