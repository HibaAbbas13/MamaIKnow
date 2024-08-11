import 'package:get/get.dart';

import 'package:mamaiknow/models/TrackerModels.dart';

class TrackerCardController extends GetxController {
  // Observable list of UpperCard and LowerCard
  var upperCards = <UpperCard>[].obs;
  var lowerCards = <LowerCard>[].obs;

  // Example method to add an UpperCard
  void addUpperCard(UpperCard card) {
    upperCards.add(card);
  }

  // Example method to add a LowerCard
  void addLowerCard(LowerCard card) {
    lowerCards.add(card);
  }
}
