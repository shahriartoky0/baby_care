import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import '../../../../controller/manual_time_controller.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/note_textfield.dart';
import '../../base/widgets/time_picker.dart';

class GrowthAddScreen extends StatelessWidget {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final TextEditingController _growthDateTEController = TextEditingController();
  final TextEditingController _noteTEController = TextEditingController();
  final TextEditingController _heightTEController = TextEditingController();
  final TextEditingController _weightTEController = TextEditingController();

  GrowthAddScreen({super.key});

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
              const AppBarRegular(title: 'Growth'),
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
                            ReusableDatePickerField(
                              prefixIcon: const Icon(CupertinoIcons.calendar_today),
                              hintText: 'Select Feeding Date',
                              controller: _growthDateTEController,
                              color: AppColors.pageColor,
                            ),
                            // Left Side Time Pickers
                            TimePickerWidget(
                              showBorder: false,
                              showTimeIcon: true,
                              label: 'Time',
                              time: timeController.startLeftTime,
                              onTimeSelected: timeController.updateStartLeftTime,
                            ),

                            const Divider(),
                            const SizedBox(height: 16),
                            MyTextFormFieldWithIcon(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CustomSvgImage(assetName: AppIcons.scaleIcon),
                              ),
                              borderColor: Colors.grey.shade300,
                              keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                              formHintText: 'Baby Height (in feet)',
                              controller: _heightTEController,
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return "Enter the venue";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            MyTextFormFieldWithIcon(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CustomSvgImage(assetName: AppIcons.weightIcon),
                              ),
                              borderColor: Colors.grey.shade300,
                              keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                              formHintText: 'Baby Weight (in pound )',
                              controller: _heightTEController,
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return "Enter the venue";
                                }
                                return null;
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
}
