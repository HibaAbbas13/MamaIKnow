import 'package:get/get.dart';

class LandingPageController extends GetxController {
  // Observable integer to keep track of the current index
  var currentIndex = 0.obs;

  // Method to change the page
  void changePage(int index) {
    currentIndex.value = index;
  }
}
