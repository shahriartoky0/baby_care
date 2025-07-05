import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import '../../../../controller/breast_feeding_controller.dart';
import '../../../../controller/manual_time_controller.dart';
import '../../../../model/timer_measure_class.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/note_textfield.dart';
import '../feeding/breastfeeding/breast_feeding_time_saving.dart';

class PumpingTimeSavingScreen extends StatelessWidget {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final TextEditingController _noteTEController = TextEditingController();

  PumpingTimeSavingScreen({super.key});

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
            /// TODO : Breast fed time saving .
          },
        ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Left Side Time Pickers
                            TileRow(
                              leadingText: 'Left side duration',
                              trailingText: Get.find<BreastfeedingController>().formatTime(
                                breastFeedingTime?.leftBreastTime ?? 0,
                              ),
                              onPressed: () {},
                            ),

                            const Divider(),

                            // Right Side Time Pickers
                            TileRow(
                              leadingText: 'Right side duration',
                              trailingText: Get.find<BreastfeedingController>().formatTime(
                                breastFeedingTime?.rightBreastTime ?? 0,
                              ),
                              onPressed: () {},
                            ),
                            const Divider(),

                            const SizedBox(height: 12),
                            // Display Total Duration
                            Center(
                              child: Text(
                                'Total Duration: ${Get.find<BreastfeedingController>().formatTime(breastFeedingTime?.totalTime ?? 0)}',
                                style: textTheme.headlineMedium,
                              ),
                            ),
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
