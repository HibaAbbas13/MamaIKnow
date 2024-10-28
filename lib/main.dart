import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:mamaiknow/Controllers/Authfiled_Controller.dart';
import 'package:mamaiknow/Controllers/TrackerCard_Controller.dart';
import 'package:mamaiknow/Screens/OnBoradingScreen/onboarding_view.dart';
import 'package:mamaiknow/Services/auth_wrapper.dart';
import 'package:mamaiknow/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize TrackerCardController
  Get.put(TrackerCardController());

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  AuthController controller = Get.put(AuthController());
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(400, 900),
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: 'MamaIKNow',
            debugShowCheckedModeBanner: false,
            theme: FlexThemeData.light(
              colors: const FlexSchemeColor(
                primary: Color(0XFFCA7CD8),
                secondary: Color(0xFFF48FB1),
                secondaryContainer: Color(0XFFF4E5F7),
                appBarColor: Color(0XFFCA7CD8),
                error: Color(0xFFCF6679),
                tertiaryContainer: Color(0XFFF4E5F7),
              ),
              surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
              blendLevel: 20,
              appBarStyle: FlexAppBarStyle.primary,
              appBarOpacity: 0.95,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 20,
                blendOnColors: false,
                inputDecoratorRadius: 12.0,
                inputDecoratorUnfocusedHasBorder: false,
                fabUseShape: true,
                interactionEffects: false,
                bottomNavigationBarElevation: 0,
                bottomNavigationBarOpacity: 0.95,
                navigationBarOpacity: 0.95,
                navigationBarMutedUnselectedIcon: true,
                inputDecoratorBorderType: FlexInputBorderType.outline,
                inputDecoratorUnfocusedBorderIsColored: false,
                dialogRadius: 12.0,
                //    datePickerHeaderBackgroundColor: Color(0xFFFF4081),
                popupMenuOpacity: 0.95,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
            ),
            darkTheme: FlexThemeData.dark(
              colors: const FlexSchemeColor(
                primary: Color(0XFFCA7CD8),
                secondary: Color(0xFFF48FB1),
                secondaryContainer: Color(0XFFF4E5F7),
                appBarColor: Color(0XFFCA7CD8),
                error: Color(0xFFCF6679),
              ),
              surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
              blendLevel: 15,
              appBarStyle: FlexAppBarStyle.background,
              appBarOpacity: 0.90,
              subThemesData: const FlexSubThemesData(
                blendOnLevel: 30,
                inputDecoratorRadius: 12.0,
                inputDecoratorUnfocusedHasBorder: false,
                fabUseShape: true,
                interactionEffects: false,
                bottomNavigationBarElevation: 0,
                bottomNavigationBarOpacity: 0.90,
                navigationBarOpacity: 0.90,
                navigationBarMutedUnselectedIcon: true,
                inputDecoratorBorderType: FlexInputBorderType.outline,
                inputDecoratorUnfocusedBorderIsColored: false,
                dialogRadius: 12.0,
                //   datePickerHeaderBackgroundColor: Color(0xFFFF80AB),
                popupMenuOpacity: 0.90,
              ),
              visualDensity: FlexColorScheme.comfortablePlatformDensity,
              useMaterial3: true,
              swapLegacyOnMaterial3: true,
            ),
            themeMode: ThemeMode.system,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            home: AuthWrapper(),
          ),
        );
      },
    );
  }
}
