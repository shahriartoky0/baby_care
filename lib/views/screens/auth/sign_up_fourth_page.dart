import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/utilities/images/app_images.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/base/components/reusable_date_picker_field.dart';
import 'package:together_baby/views/screens/auth/sign_up_final_page.dart';

import '../../../utilities/app_colors.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/progress_bar.dart';
import '../../base/widgets/app_custom_textfield.dart';

class SignUpFourthPage extends StatefulWidget {
  const SignUpFourthPage({super.key});

  @override
  State<SignUpFourthPage> createState() => _SignUpFourthPageState();
}

class _SignUpFourthPageState extends State<SignUpFourthPage> {
  String relation = '';

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.pageColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
          child: ListView(
            children: <Widget>[
              /// ===============> Custom AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 3),

              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CustomProgressBar(progress: 1),
                  const CustomProgressBar(progress: 0.9),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip',
                      style: textTheme.headlineMedium?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('How are you related to Tuba ?', style: textTheme.displayLarge),

              const SizedBox(height: 32),
              buildContainer(
                textTheme: textTheme,
                onPressed: () {
                  relation = 'Mother';
                  setState(() {});
                },
                label: 'Mother',
                selected: relation == 'Mother',
              ),
              const SizedBox(height: 16),
              buildContainer(
                textTheme: textTheme,
                onPressed: () {
                  relation = 'Father';
                  setState(() {});
                },
                label: 'Father',
                selected: relation == 'Father',
              ),
              const SizedBox(height: 16),
              buildContainer(
                textTheme: textTheme,
                onPressed: () {
                  relation = 'Guardian';
                  setState(() {});
                },
                label: 'Guardian',
                selected: relation == 'Guardian',
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildMaterial(
                    textTheme: textTheme,
                    onPressed: () {
                      Get.back();
                    },
                    label: 'Back',
                  ),
                  buildMaterial(
                    textTheme: textTheme,
                    onPressed: () {
                      Get.to(() => const SignUpFinalPage());
                    },
                    label: 'Next',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildContainer({
    required TextTheme textTheme,
    required VoidCallback onPressed,
    required String label,
    required bool selected,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.modalIconInnerColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: textTheme.headlineMedium?.copyWith(
                color: selected ? Colors.white : Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12,
              color: selected ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Material buildMaterial({
    required TextTheme textTheme,
    required VoidCallback onPressed,
    required String label,
  }) {
    return Material(
      color: label == 'Next' ? AppColors.primaryColor : Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        splashColor: AppColors.primaryColor.withValues(alpha: 0.3),
        // Ripple color when tapping
        child: Container(
          width: Get.width * 0.4,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: textTheme.displayLarge?.copyWith(
                color: label == 'Next' ? Colors.white : AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
