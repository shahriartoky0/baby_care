import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/screens/auth/sign_in_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    // Navigate to the next page after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => SignInPage());
    });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomSvgImage(
                assetName: AppIcons.splashImage,
                width: MediaQuery.sizeOf(context).width * 7,
                height: MediaQuery.sizeOf(context).height * 0.6,
              ),
              Text('Welcome to Together Baby!', style: textTheme.titleMedium),
              const SizedBox(height: 12),
              Text(
                ' Your all-in-one baby care companion — making parenting easier and more joyful.',
                style: textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
