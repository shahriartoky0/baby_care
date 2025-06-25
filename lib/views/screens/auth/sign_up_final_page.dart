import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';

import '../../../utilities/app_colors.dart';
import '../../base/components/progress_bar.dart';

class SignUpFinalPage extends StatefulWidget {
  const SignUpFinalPage({super.key});

  @override
  State<SignUpFinalPage> createState() => _SignUpFinalPageState();
}

class _SignUpFinalPageState extends State<SignUpFinalPage> {
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
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12,  ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.modalIconOuterColor),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CustomSvgImage(assetName: AppIcons.girlIcon, width: 24, height: 24),
                          Text(
                            "Baby Information",
                            style: textTheme.headlineMedium?.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: AppColors.modalIconOuterColor),
                    infoTile(
                      textTheme: textTheme,
                      name: 'Maliha Tuba',
                      icon: const Icon(Icons.account_circle),
                      label: ' Name',
                    ),
                    infoTile(
                      textTheme: textTheme,
                      name: 'Maliha Tuba',
                      icon: CustomSvgImage(assetName: AppIcons.genderIcon, width: 22, height: 22),
                      label: 'Gender',
                    ),
                    infoTile(
                      textTheme: textTheme,
                      name: '29 February , 2004',
                      icon: const Icon(CupertinoIcons.calendar_today),
                      label: 'Date of Birth',
                    ),
                    infoTile(
                      textTheme: textTheme,
                      name: '3.5 Pound',
                      icon: CustomSvgImage(assetName: AppIcons.weightIcon, width: 24, height: 24),
                      label: 'Weight',
                    ),
                    infoTile(
                      textTheme: textTheme,
                      name: '2.5 Feet',
                      icon: CustomSvgImage(assetName: AppIcons.scaleIcon, width: 24, height: 24),
                      label: 'Height',
                    ),
                    infoTile(
                      textTheme: textTheme,
                      name: 'B+',
                      icon: CustomSvgImage(assetName: AppIcons.bloodIcon, width: 24, height: 24),
                      label: 'Blood Group',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
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
                  buildMaterial(textTheme: textTheme, onPressed: () {}, label: 'Submit'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding infoTile({
    required TextTheme textTheme,
    required String name,
    required String label,
    required Widget icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: icon,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(label, style: textTheme.labelSmall),
            const SizedBox(height: 3),
            Text(
              name,
              style: textTheme.displayLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
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
      color: label == 'Submit' ? AppColors.primaryColor : Colors.white,
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
                color: label == 'Submit' ? Colors.white : AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
