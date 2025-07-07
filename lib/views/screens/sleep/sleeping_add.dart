import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import 'package:together_baby/views/screens/pumping/pumping_manual_time_taking.dart';
import 'package:together_baby/views/screens/pumping/pumping_time_taking.dart';
import 'package:together_baby/views/screens/sleep/sleep_manual_time_taking.dart';
import 'package:together_baby/views/screens/sleep/sleep_time_saving.dart';
import '../../../../controller/breast_feeding_controller.dart';
import '../../../../model/timer_measure_class.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/large_letter_container.dart';

class AddSleeping extends StatelessWidget {
  AddSleeping({super.key});

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
                : controller.activeSide.value == 'L' && controller.isRunning.value
                ? const SizedBox.shrink()
                : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
                  child: PrimaryButton(
                    buttonText: 'Next',
                    onPressed: () {
                      final TimerMeasureClass sleepTiming = TimerMeasureClass(
                        sleepStopTime: controller.sleepStopTime.value,
                        pressedTime: controller.takenTime.value,
                        leftBreastTime: controller.leftSideSeconds.value,
                        rightBreastTime: controller.rightSideSeconds.value,
                        totalTime: controller.seconds.value,
                      );
                      Get.to(() => SleepingTimeSavingScreen(), arguments: sleepTiming);
                    },
                  ),
                ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppBarRegular(title: 'Sleep'),
              SizedBox(height: Get.height * 0.1),

              /// ==========================>  Timer Display
              Center(
                child: Obx(
                  () => Container(
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
                          controller.formatTimeHour(controller.leftSideSeconds.value),
                          style: textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          ' HOUR : MIN : SEC',
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: Get.height * 0.06),

              Center(
                child: Text(
                  'Click on start to begin tracking sleep timer',
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
                                    controller.sleepStopTime.value = DateTime.now();
                                  },
                                )
                                : LargeLetterContainer(
                                  letter: 'Start',
                                  onTap: () {
                                    controller.startTimer('L');
                                    if (controller.seconds.value < 1) {
                                      controller.takenTime.value = DateTime.now();
                                    }
                                  },
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
                              Get.to(() => SleepingManualTimeScreen());
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
