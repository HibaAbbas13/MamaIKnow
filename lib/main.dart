import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mamaiknow/Controllers/Authfiled_Controller.dart';
import 'package:mamaiknow/Controllers/HomePage_Controller.dart';
import 'package:mamaiknow/Controllers/SignInSignup_Controller.dart';
import 'package:mamaiknow/Controllers/TrackerCard_Controller.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Controllers/Logging_Controller.dart';
import 'package:mamaiknow/Controllers/PeriodTracker_Controller.dart';
import 'package:mamaiknow/Screens/Auth/SignupScreen.dart';
import 'package:mamaiknow/Screens/Status/StatusScreen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(AppColors.defaultOverlay);
  await Firebase.initializeApp();
  FlutterNativeSplash.remove();

  // Initialize GetX Controllers
  Get.put(PeriodTrackerController());
  Get.put(LoggingController());
  Get.put(TrackerCardController());
  Get.put(HomeController());
  Get.put(AuthFieldController());
  Get.put(SignUpController());
  Get.put(SignInController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(400, 900),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: 'MamaIKnow',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.kRed,
              scaffoldBackgroundColor: AppColors.kWhite,
              appBarTheme: AppBarTheme(backgroundColor: AppColors.kWhite),
            ),
            scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
            home: SignUpScreen(),
          ),
        );
      },
    );
  }
}
