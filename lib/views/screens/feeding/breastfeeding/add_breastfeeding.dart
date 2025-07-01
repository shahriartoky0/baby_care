import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import '../../../../controller/breast_feeding_controller.dart';
import '../../../base/widgets/app_bar.dart';
import '../../../base/widgets/large_letter_container.dart';

class AddBreastfeeding extends StatelessWidget {
  AddBreastfeeding({super.key});

  final BreastfeedingController controller = Get.put(BreastfeedingController());

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(
        () =>
            controller.seconds.value == 0
                ? const SizedBox.shrink()
                : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                  child: PrimaryButton(
                    buttonText: 'Next',
                    onPressed: () {
                      final BreastFeedingTiming breastFeedingTiming = BreastFeedingTiming(
                        leftBreastTime: controller.leftSideSeconds.value,
                        rightBreastTime: controller.leftSideSeconds.value,
                        totalTime: controller.seconds.value,
                      );
                    },
                  ),
                ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppBarRegular(title: 'Breast Feeding'),
              SizedBox(height: Get.height * 0.1),

              /// ==========================>  Timer Display
              Center(
                child: Obx(
                  () =>
                      controller.seconds.value == 0
                          ? const SizedBox.shrink()
                          : Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.primaryColor.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Total Duration",
                                  style: textTheme.displayLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  controller.formatTime(controller.seconds.value),
                                  style: textTheme.displayLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                if (controller.activeSide.value.isNotEmpty)
                                  Text(
                                    'Active: ${controller.activeSide.value} side',
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                ),
              ),

              SizedBox(height: Get.height * 0.08),

              // Display separate times for both sides
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Obx(
                  () =>
                      controller.seconds.value == 0
                          ? const SizedBox.shrink()
                          : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Left Side',
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    controller.formatTime(controller.leftSideSeconds.value),
                                    style: textTheme.displayMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    'Right Side',
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    controller.formatTime(controller.rightSideSeconds.value),
                                    style: textTheme.displayMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                ),
              ),

              SizedBox(height: Get.height * 0.08),

              Center(
                child: Text(
                  'Select the side in which you are breastfeeding now',
                  style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: Get.height * 0.08),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.startTimer('L'),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                        child:
                            controller.activeSide.value == 'L' && controller.isRunning.value
                                ? LargeLetterContainer(
                                  letter: 'Stop',
                                  onTap: () {
                                    controller.startTimer('L');
                                  },
                                )
                                : LargeLetterContainer(
                                  letter: 'L',
                                  onTap: () => controller.startTimer('L'),
                                ),
                      ),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.startTimer('R'),
                      child: Container(
                        child:
                            controller.activeSide.value == 'R' && controller.isRunning.value
                                ? LargeLetterContainer(
                                  letter: 'Stop',
                                  onTap: () {
                                    controller.startTimer('R');
                                  },
                                )
                                : LargeLetterContainer(
                                  letter: 'R',
                                  onTap: () => controller.startTimer('R'),
                                ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: Get.height * 0.04),
              // Control Buttons
              Obx(
                () =>
                    controller.seconds.value > 0
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            TextButton.icon(
                              onPressed:
                                  controller.seconds.value > 0 ? controller.restartTimer : null,
                              icon: const Icon(
                                Icons.refresh,
                                color: AppColors.primaryColor,
                                size: 28,
                              ),
                              label: Text(
                                'Restart',
                                style: textTheme.displayMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                // backgroundColor: Colors.orange,
                                // foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              ),
                            ),
                          ],
                        )
                        : const SizedBox.shrink(),
              ),

              SizedBox(height: Get.height * 0.02),

              Obx(
                () =>
                    controller.seconds.value == 0
                        ? Center(
                          child: TextButton.icon(
                            onPressed: () {
                              // Handle manual entry
                            },
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
                        )
                        : const SizedBox.shrink(),
              ),
              if (MediaQuery.of(context).size.width > 600) const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

class BreastFeedingTiming {
  final int leftBreastTime;
  final int rightBreastTime;
  final int totalTime;
  final DateTime registeredTime;

  // Constructor
  BreastFeedingTiming({
    required this.leftBreastTime,
    required this.rightBreastTime,
    required this.totalTime,
    DateTime? registeredTime,
  }) : registeredTime = registeredTime ?? DateTime.now();
}
