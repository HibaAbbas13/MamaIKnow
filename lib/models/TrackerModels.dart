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
    color: const Color(0xFF5ede36),
    type: 'Cramps',
  ),
  UpperCard(
    day: 'Aug 5-10',
    title: 'Fertility',
    subtitle: 'Ovulation',
    date: 'Aug 7',
    color: const Color(0xFFFF002E),
    type: 'Cervical Mucus',
  ),
];
