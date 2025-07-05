import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import '../../../../controller/manual_time_controller.dart';
import '../../base/components/custom_dropdown.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/widgets/app_bar.dart';
 import '../../base/widgets/note_textfield.dart';
import '../../base/widgets/time_picker.dart';

class SleepingManualTimeScreen extends StatelessWidget {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final TextEditingController _feedingDateTEController = TextEditingController();
  final TextEditingController _noteTEController = TextEditingController();
  final List<DropdownItem<String>> emotions = <DropdownItem<String>>[
    const DropdownItem(value: 'very_happy', label: 'Very Happy'),
    const DropdownItem(value: 'happy', label: 'Happy'),
    const DropdownItem(value: 'crying', label: 'Crying'),
    const DropdownItem(value: 'angry', label: 'Angry'),
  ];

  SleepingManualTimeScreen({super.key});

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
              const AppBarRegular(title: 'Sleeping'),
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
                              label: 'Sleep Begin',
                              time: timeController.startLeftTime,
                              onTimeSelected: timeController.updateStartLeftTime,
                            ),
                            TimePickerWidget(
                              label: 'Sleep End',
                              time: timeController.endLeftTime,
                              onTimeSelected: timeController.updateEndLeftTime,
                            ),
                            const Divider(),

                            const SizedBox(height: 12),
                            // Display Total Duration
                            Obx(() {
                              return Center(
                                child: Text(
                                  'Total Duration: ${_formatDuration(timeController.leftDuration.value)}',
                                  style: textTheme.headlineMedium,
                                ),
                              );
                            }),
                            const SizedBox(height: 24),
                            CustomDropdown<String>(
                              backgroundColor: AppColors.white,
                              dropdownColor: AppColors.pageColor,
                              items: emotions,
                              hint: 'Sleep After-Effect',
                              dropdownMaxHeight: 250,
                              onChanged: (String? value) {
                                print('Selected searchable country: $value');
                              },
                            ),
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

  String _formatDuration(Duration duration) {
    // Calculate hours and minutes from the duration
    int hours = duration.inHours;
    int minutes = duration.inMinutes % 60; // Get the remaining minutes

    // Format the time as HH:MM
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }
}
