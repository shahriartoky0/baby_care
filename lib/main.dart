import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_theme.dart';
import 'package:together_baby/views/screens/auth/sign_in_page.dart';
import 'package:together_baby/views/screens/feeding/breastfeeding/breast_feeding_time_saving.dart';
 import 'package:together_baby/views/screens/feeding/feeding_homepage.dart';
import 'package:together_baby/views/screens/home/home_screen.dart';
import 'package:together_baby/views/screens/main_bottom_nav.dart';

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
      home: const FeedingHomepage(),
      // home:   BreastFeedingTimeSavingScreen(),
      // home: const SignInPage(),
      initialBinding: ControllerBinder(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {}
}
