import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/utilities/images/app_images.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/screens/auth/sign_up_third_page.dart';

import '../../../utilities/app_colors.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/progress_bar.dart';
import '../../base/widgets/app_custom_textfield.dart';

class SignUpSecondPage extends StatefulWidget {
  const SignUpSecondPage({super.key});

  @override
  State<SignUpSecondPage> createState() => _SignUpSecondPageState();
}

class _SignUpSecondPageState extends State<SignUpSecondPage> {
  final TextEditingController _babyNameTEController = TextEditingController();

  String? selectedGender;

  // Add this to track selected gender
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: Get.width * 0.98,
        child: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            // if (_formKey.currentState!.validate() && isValidNumber == true) {}
            Get.to(() => const SignUpThirdPage());
          },
          child: Text('Next', style: textTheme.labelMedium),
        ),
      ),
      backgroundColor: AppColors.pageColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
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
                  const CustomProgressBar(progress: 0.4),
                  const CustomProgressBar(progress: 0),
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
              Text('Let’s start with your baby’s information', style: textTheme.displayLarge),
              const SizedBox(height: 12),
              const Text(
                'To help us make better recommendations and have a better experience in future, please tell us a little about your baby and the activities you would want to track.',
              ),
              const SizedBox(height: 32),
              Text('Baby Name', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              AppCustomContainerField(
                containerChild: MyTextFormFieldWithIcon(
                  formHintText: "Enter Baby's Name",
                  prefixIcon: const Icon(Icons.account_circle, color: AppColors.primaryColor),
                  controller: _babyNameTEController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter Your Name !!';
                      }
                      return null;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 12),
              Text('Baby Gender', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMaterial(
                    textTheme: textTheme,
                    onPressed: () {
                      setState(() {
                        selectedGender = 'Boy';
                      });
                    },
                    label: 'Boy',
                    path: AppIcons.boyIcon,
                    isSelected: selectedGender == 'Boy',
                  ),
                  buildMaterial(
                    textTheme: textTheme,
                    onPressed: () {
                      setState(() {
                        selectedGender = 'Girl';
                      });
                    },
                    label: 'Girl',
                    path: AppIcons.girlIcon,
                    isSelected: selectedGender == 'Girl',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material buildMaterial({
    required TextTheme textTheme,
    required VoidCallback onPressed,
    required String label,
    required String path,
    required bool isSelected,
  }) {
    return Material(
      color: isSelected ? AppColors.primaryColor : Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        splashColor:
            isSelected
                ? Colors.white.withValues(alpha: 0.3)
                : AppColors.primaryColor.withValues(alpha: 0.3),
        // Ripple color when tapping
        child: Container(
          width: Get.width * 0.4,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: isSelected ? Colors.black : AppColors.primaryColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomSvgImage(assetName: path),
              Text(
                label,
                style: textTheme.displayLarge?.copyWith(
                  color: isSelected ? Colors.white : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
