import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mamaiknow/Data/AppColors.dart';
import 'package:mamaiknow/Providers/PeriodTracker.dart';
import 'package:mamaiknow/Screens/HomeScreen/HomeScreen.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(AppColors.defaultOverlay);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PeriodTrackerProvider()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: MaterialApp(
                title: 'MamaIKnow',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: AppColors.kRed,
                    scaffoldBackgroundColor: AppColors.kWhite,
                    appBarTheme:
                        AppBarTheme(backgroundColor: AppColors.kWhite)),
                scrollBehavior:
                    const ScrollBehavior().copyWith(overscroll: false),
                home: HomeScreen(),
              ),
            );
          },
        ));
  }
}
