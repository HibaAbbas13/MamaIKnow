import 'package:get/get.dart';
import 'package:mamaiknow/Services/FirestoreService.dart';
import 'package:mamaiknow/models/LoggingModel.dart';

class LoggingController extends GetxController {
  final FirestoreService _firestoreService = FirestoreService();
  
  var loggingDataList = <LoggingData>[].obs; // Observable list to store the data

  @override
  void onInit() {
    super.onInit();
    loggingDataStream(); // Initialize the stream on controller initialization
  }

  Future<void> addLoggingData(LoggingData data) async {
    await _firestoreService.addLoggingData(data);
  }

  void loggingDataStream() {
    _firestoreService.getLoggingData().listen((data) {
      loggingDataList.value = data; // Update the observable list
    });
  }
}
