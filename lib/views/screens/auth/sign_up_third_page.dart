import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/utilities/images/app_images.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/base/components/reusable_date_picker_field.dart';
import 'package:together_baby/views/screens/auth/sign_up_fourth_page.dart';

import '../../../utilities/app_colors.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/progress_bar.dart';
import '../../base/widgets/app_custom_textfield.dart';

class SignUpThirdPage extends StatefulWidget {
  const SignUpThirdPage({super.key});

  @override
  State<SignUpThirdPage> createState() => _SignUpThirdPageState();
}

class _SignUpThirdPageState extends State<SignUpThirdPage> {
  final TextEditingController _babyDateOfBirthTEController = TextEditingController();
  final TextEditingController _babyWeightTEController = TextEditingController();
  final TextEditingController _babyHeightTEController = TextEditingController();
  final TextEditingController _babyBloodTEController = TextEditingController();
  String? selectedBloodType;

  List<String> bloodTypes = <String>['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

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
              Text('When was tuba born?', style: textTheme.displayLarge),

              const SizedBox(height: 32),
              Text('Baby Name', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              AppCustomContainerField(
                containerChild: ReusableDatePickerField(
                  prefixIcon: const Icon(CupertinoIcons.calendar_today),
                  hintText: 'Select Date of birth',
                  controller: _babyDateOfBirthTEController,
                  color: AppColors.pageColor,
                ),
              ),
              const SizedBox(height: 24),

              /// ========> Weight ==========>
              Text('Baby Weight (pound)', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              AppCustomContainerField(
                containerChild: MyTextFormFieldWithIcon(
                  keyBoardType: const TextInputType.numberWithOptions(decimal: true),

                  formHintText: 'Weight',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomSvgImage(assetName: AppIcons.weightIcon),
                  ),
                  controller: _babyWeightTEController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Don't leave empty";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24),

              /// ========> Height ==========>
              Text('Baby Height (cm)', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              AppCustomContainerField(
                containerChild: MyTextFormFieldWithIcon(
                  keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                  formHintText: 'Height',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomSvgImage(assetName: AppIcons.scaleIcon),
                  ),
                  controller: _babyHeightTEController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Don't leave empty";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24),

              /// ========> Height ==========>
              Text('Blood Group', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              // AppCustomContainerField(
              //   containerChild: MyTextFormFieldWithIcon(
              //     formHintText: 'Blood',
              //     prefixIcon: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: CustomSvgImage(assetName: AppIcons.bloodIcon),
              //     ),
              //     controller: _babyBloodTEController,
              //     validator: (String? value) {
              //       if (value?.isEmpty ?? true) {
              //         return "Don't leave empty";
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              CustomDropdown(
                items: bloodTypes,
                selectedValue: selectedBloodType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedBloodType = newValue;
                  });
                },
                hintText: 'Select Blood Type',
                controller: _babyBloodTEController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSvgImage(assetName: AppIcons.bloodIcon),
                ),
              ),
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
                      Get.to(() => const SignUpFourthPage());
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

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final TextEditingController controller;
  final Widget prefixIcon;

  const CustomDropdown({
    super.key,
    required this.items,
    this.selectedValue,
    required this.onChanged,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // Same borderRadius for consistency
          borderSide: const BorderSide(
            color: AppColors.primaryColor, // Apply the primary color
          ),
        ),
      ),
      items:
          items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: Theme.of(context).textTheme.headlineMedium),
            );
          }).toList(),
      onChanged: onChanged,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
    );
  }
}
