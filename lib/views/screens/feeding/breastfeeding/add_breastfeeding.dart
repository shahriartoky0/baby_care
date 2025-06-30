import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import '../../../base/widgets/app_bar.dart';
import '../../../base/widgets/large_letter_container.dart';

class AddBreastfeeding extends StatelessWidget {
  const AddBreastfeeding({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppBarRegular(title: 'Breast Feeding'),
              SizedBox(height: Get.height * 0.15),
              Text(
                'Select the side in which you are breastfeeding now',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  LargeLetterContainer(letter: 'L', onTap: () {}),
                  LargeLetterContainer(letter: 'R', onTap: () {}),
                ],
              ),
              SizedBox(height: Get.height * 0.1),
              Center(
                child: TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Manual Entry',
                    style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  icon: const Icon(
                    Icons.keyboard_alt_outlined,
                    color: AppColors.primaryColor,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


