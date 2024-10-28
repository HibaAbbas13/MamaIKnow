import 'dart:convert';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/HomePage_Controller.dart';
import 'package:mamaiknow/Controllers/Logging_Controller.dart';
import 'package:mamaiknow/Controllers/PeriodTracker_Controller.dart';
import 'package:mamaiknow/Controllers/TrackerCard_Controller.dart';

Future<T?> callFutureFunctionWithLoadingOverlay<T>({
  required Future<T> Function() asyncFunction,
  bool showOverLay = true,
}) async {
  T? result;
  if (!showOverLay) {
    try {
      result = await asyncFunction();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return result;
  } else {
    await Get.showOverlay(
      asyncFunction: () async {
        try {
          result = await asyncFunction();
        } catch (e) {
          Fluttertoast.showToast(msg: e.toString());
        }
      },
      loadingWidget: const CircularProgressIndicator(),
    );
    return result;
  }
}

class AppUtils {
  static String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';

    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static putAllControllers() {
    Get.put(PeriodTrackerController());
    Get.put(LoggingController());
    Get.put(TrackerCardController());
    Get.put(HomeController());
  }

  static removeAllControllers() {
    Get.delete<PeriodTrackerController>();
    Get.delete<LoggingController>();
    Get.delete<TrackerCardController>();
    Get.delete<HomeController>();
  }
}
