import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mamaiknow/models/TrackerModels.dart';

class TrackerCardController extends GetxController {
  // Observable list of UpperCard and LowerCard
  var upperCards = <UpperCard>[].obs;
  var lowerCards = <LowerCard>[].obs;

  var selectedSymptom = Rx<String?>(null);
  var selectedSeverity = 0.obs;
  var selectedMood = Rx<String?>(null);
  final notesController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadCards();
  }

  void loadCards() {
    // Sample data for upper cards
    upperCards.addAll([
      UpperCard(
          title: "Card 1",
          day: "Mon",
          subtitle: "Sub 1",
          date: "01/01",
          type: "Type 1",
          color: Colors.blue),
      UpperCard(
          title: "Card 2",
          day: "Tue",
          subtitle: "Sub 2",
          date: "02/01",
          type: "Type 2",
          color: Colors.green),
    ]);

    // Sample data for lower cards
    lowerCards.addAll([
      LowerCard(
          title: "Lower 1",
          image: "assets/image1.png",
          icon: "assets/icon1.png"),
      LowerCard(
          title: "Lower 2",
          image: "assets/image2.png",
          icon: "assets/icon2.png"),
    ]);
  }

  void onSymptomChanged(String? symptom) {
    selectedSymptom.value = symptom;
  }

  void onSeverityChanged(int? severity) {
    if (severity != null) {
      selectedSeverity.value = severity;
    }
  }

  void onMoodChanged(String? mood) {
    selectedMood.value = mood;
  }

  @override
  void onClose() {
    notesController.dispose();
    super.onClose();
  }
}
