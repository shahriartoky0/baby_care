import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import '../../../../controller/breast_feeding_controller.dart';
import '../../../../controller/manual_time_controller.dart';
import '../../../../model/timer_measure_class.dart';
import '../../../utilities/app_colors.dart';
import '../../base/components/custom_dropdown.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/note_textfield.dart';
import '../feeding/breastfeeding/breast_feeding_time_saving.dart';

class SleepingTimeSavingScreen extends StatelessWidget {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final TextEditingController _noteTEController = TextEditingController();
  final List<DropdownItem<String>> emotions = <DropdownItem<String>>[
    const DropdownItem(value: 'very_happy', label: 'Very Happy'),
    const DropdownItem(value: 'happy', label: 'Happy'),
    const DropdownItem(value: 'crying', label: 'Crying'),
    const DropdownItem(value: 'angry', label: 'Angry'),
  ];

  SleepingTimeSavingScreen({super.key});

  final TimerMeasureClass? breastFeedingTime = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .98,
        child: PrimaryButton(
          buttonText: 'Save',
          onPressed: () {
            /// TODO : Sleep fed time saving .
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AppBarRegular(title: 'Sleep'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey, width: 1.2),
                  ),
                  child: Column(
                    children: <Widget>[
                      // Container(
                      //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      //   width: double.infinity,
                      //   decoration: const BoxDecoration(
                      //     color: AppColors.primaryColor,
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(12),
                      //       topRight: Radius.circular(12),
                      //     ),
                      //   ),
                      //   child: Text(
                      //     'Sleep Details',
                      //     textAlign: TextAlign.center,
                      //     style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Left Side Time Pickers
                            TileRow(
                              leadingText: 'Sleep start',
                              trailingText: Get.find<BreastfeedingController>().formatCurrentTime(
                                time: breastFeedingTime!.pressedTime!,
                              ),
                              onPressed: null,
                            ),TileRow(
                              leadingText: 'Sleep start',
                              trailingText: Get.find<BreastfeedingController>().formatCurrentTime(
                                time: breastFeedingTime!.sleepStopTime!,
                              ),
                              onPressed: null,
                            ),

                            CustomDropdown<String>(
                              label:'Sleep After-Effect' ,
                              backgroundColor: AppColors.white,
                              dropdownColor: AppColors.pageColor,
                              items: emotions,
                              hint: 'Sleep After-Effect',
                              dropdownMaxHeight: 250,
                              onChanged: (String? value) {
                                print('Selected searchable country: $value');
                              },
                            ),


                            const SizedBox(height: 12),
                            // Display Total Duration
                            Center(
                              child: Text(
                                'Total Duration: ${Get.find<BreastfeedingController>().formatTimeHour(breastFeedingTime?.leftBreastTime ?? 0)}',
                                style: textTheme.headlineMedium,
                              ),
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
}
