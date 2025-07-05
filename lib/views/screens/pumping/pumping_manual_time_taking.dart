import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import '../../../../controller/manual_time_controller.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/note_textfield.dart';
import '../../base/widgets/time_picker.dart';

class PumpingManualTimeScreen extends StatelessWidget {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final TextEditingController _feedingDateTEController = TextEditingController();
  final TextEditingController _noteTEController = TextEditingController();

  PumpingManualTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .98,
        child: PrimaryButton(buttonText: 'Save', onPressed: () {}),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AppBarRegular(title: 'Pumping'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey, width: 1.2),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Manual Entry',
                          textAlign: TextAlign.center,
                          style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ReusableDatePickerField(
                              prefixIcon: const Icon(CupertinoIcons.calendar_today),
                              hintText: 'Select Feeding Date',
                              controller: _feedingDateTEController,
                              color: AppColors.pageColor,
                            ),
                            // Left Side Time Pickers
                            TimePickerWidget(
                              label: 'Left Side Start Time',
                              time: timeController.startLeftTime,
                              onTimeSelected: timeController.updateStartLeftTime,
                            ),
                            TimePickerWidget(
                              label: 'Left Side End Time',
                              time: timeController.endLeftTime,
                              onTimeSelected: timeController.updateEndLeftTime,
                            ),
                            const Divider(),

                            // Right Side Time Pickers
                            TimePickerWidget(
                              label: 'Right Side Start Time',
                              time: timeController.startRightTime,
                              onTimeSelected: timeController.updateStartRightTime,
                            ),
                            TimePickerWidget(
                              label: 'Right Side End Time',
                              time: timeController.endRightTime,
                              onTimeSelected: timeController.updateEndRightTime,
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // Left Circle Letter with Duration
                                Row(
                                  spacing: 8,
                                  children: <Widget>[
                                    const CircleLetter(),
                                    Obx(
                                      () => Text(
                                        '${timeController.leftDuration.value.inMinutes.toString()} min',
                                        style: textTheme.displayMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Right Circle Letter with Duration
                                Row(
                                  spacing: 8,
                                  children: <Widget>[
                                    const CircleLetter(letter: 'R'),
                                    Obx(
                                      () => Text(
                                        '${timeController.rightDuration.value.inMinutes.toString()} min',
                                        style: textTheme.displayMedium?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // Display Total Duration
                            Obx(() {
                              return Center(
                                child: Text(
                                  'Total Duration: ${timeController.totalDuration}',
                                  style: textTheme.headlineMedium,
                                ),
                              );
                            }),
                            const Divider(),
                            const SizedBox(height: 16),
                            NoteTextField(noteTEController: _noteTEController),

                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
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
