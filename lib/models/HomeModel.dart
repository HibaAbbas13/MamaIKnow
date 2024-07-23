class CycleData {
  String image;
  String title;
  String time;
  String name;
  String date;
  String log;
  String icon;

  CycleData({
    required this.image,
    required this.title,
    required this.time,
    required this.name,
    required this.date,
    required this.log,
    required this.icon,
  });
}

List<CycleData> cycledata = [
  CycleData(
    image: "assets/icons/Group.svg",
    title: 'Period Cycle',
    time: 'Day 12 of 28',
    name: 'Next Period',
    date: 'Aug 10',
    log: 'Log Symptomps',
    icon: 'assets/icons/calender.svg',
  ),
  CycleData(
    image: 'assets/icons/sprout-tree.svg',
    title: 'Fertility Period',
    time: 'Aug 5 - 10',
    name: 'Ovulation',
    date: 'Aug 7',
    log: 'Log Signs',
    icon: 'assets/icons/stats.svg',
  ),
  CycleData(
    image: 'assets/icons/dove.svg',
    title: 'Pregnancy\nJourney',
    time: 'Week 24',
    name: 'Baby is the size of a mango',
    date: '',
    log: 'Log Symptomps',
    icon: 'assets/icons/stats.svg',
  ),
  CycleData(
    image: 'assets/icons/hearts-heart.svg',
    title: 'Contractions\nTracker',
    time: '',
    name: 'No contractions logged',
    date: '',
    log: 'Start Timer',
    icon: 'assets/icons/time.svg',
  ),
];
