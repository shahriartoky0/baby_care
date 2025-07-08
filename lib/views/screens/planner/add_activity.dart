import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import '../../../../controller/manual_time_controller.dart';
import '../../base/components/custom_dropdown.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/components/switch_with_controller.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/note_textfield.dart';
import '../../base/widgets/time_picker.dart';

class AddActivityPage extends StatelessWidget {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final TextEditingController _activityDateTEController = TextEditingController();
  final TextEditingController _noteTEController = TextEditingController();

  AddActivityPage({super.key});

  final List<DropdownItem<String>> activityTypes = <DropdownItem<String>>[
    const DropdownItem(value: 'feeding', label: 'Feeding'),
    const DropdownItem(value: 'pumping', label: 'Pumping'),
    const DropdownItem(value: 'diaper', label: 'Diaper'),
    const DropdownItem(value: 'sleep', label: 'Sleep'),
    const DropdownItem(value: 'medicine', label: 'Medicine'),
    const DropdownItem(value: 'vaccine', label: 'Vaccine'),
    const DropdownItem(value: 'growth', label: 'Growth'),
  ];

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ReminderController controller = Get.put(ReminderController());

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
              const AppBarRegular(title: 'Add Activity'),
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
                              hintText: 'Select Activity Date',
                              controller: _activityDateTEController,
                              color: AppColors.pageColor,
                            ),
                            // Left Side Time Pickers
                            TimePickerWidget(
                              showTimeIcon: true,
                              label: 'Time',
                              time: timeController.startLeftTime,
                              onTimeSelected: timeController.updateStartLeftTime,
                            ),

                            const Divider(),

                            const SizedBox(height: 16),

                            CustomDropdown<String>(
                              backgroundColor: AppColors.white,
                              dropdownColor: AppColors.pageColor,
                              items: activityTypes,
                              labelStyle: textTheme.headlineMedium,
                              label: "Activity Type",
                              hint: "Select Activity Type",
                              dropdownMaxHeight: 250,
                              onChanged: (String? value) {
                                print('Selected searchable skin: $value');
                              },
                            ),
                            const SizedBox(height: 16),
                            ReminderSwitch(
                              label: 'Remind me 1 hour before schedule',
                              onChange: () {},
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
