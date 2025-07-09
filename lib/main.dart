import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_theme.dart';
import 'package:together_baby/views/screens/auth/sign_in_page.dart';
import 'package:together_baby/views/screens/baby_care/baby_care_homepage.dart';
import 'package:together_baby/views/screens/diaper/diaper_homepage.dart';
import 'package:together_baby/views/screens/feeding/breastfeeding/breast_feeding_time_saving.dart';
import 'package:together_baby/views/screens/feeding/feeding_homepage.dart';
import 'package:together_baby/views/screens/growth/growth_homepage.dart';
import 'package:together_baby/views/screens/home/home_screen.dart';
import 'package:together_baby/views/screens/main_bottom_nav.dart';
import 'package:together_baby/views/screens/medicine/medicine_homepage.dart';
import 'package:together_baby/views/screens/planner/planner_homepage.dart';
import 'package:together_baby/views/screens/pumping/pumping_homepage.dart';
import 'package:together_baby/views/screens/sleep/sleeping_homepage.dart';
import 'package:together_baby/views/screens/splash_screen.dart';
import 'package:together_baby/views/screens/vaccine/vaccine_homepage.dart';

import 'controller/breast_feeding_controller.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: MainBottomNavScreen(),
      // home:FeedingTrackerPage(
      //   title: 'Baby Feeding',
      //   primaryColor: const Color(0xFF4A7C7E),
      //   accentColor: const Color(0xFF6B9B9E),
      //   onDeleteSession: (sessionId) {
      //     if (kDebugMode) {
      //       print('Session deleted: $sessionId');
      //     }
      //   },
      // ),
      theme: AppTheme.defaultThemeData,
      navigatorKey: navigatorKey,
      // home: const SignInPage(),
      home: const SplashScreen(),
      // home: const FeedingHomepage(),
      // home: DiaperHomePage(selectedDate: DateTime.now()),
      // home: SleepHomepage(selectedDate: DateTime.now()),
      // home: const BabyCareHomepage(),
      // home: PlannerHomePage(selectedDate: DateTime.now()),
      // home: const SignInPage(),
      // home: MedicineHomepage(selectedDate: DateTime.now()),
      // home: VaccineHomepage(selectedDate: DateTime.now()),
      // home: GrowthHomepage(selectedDate: DateTime.now()),
      initialBinding: ControllerBinder(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BreastfeedingController());
  }
}
