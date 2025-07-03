import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/primary_button.dart';
import '../../../../controller/manual_time_controller.dart';
import '../../../base/components/custom_dropdown.dart';
import '../../../base/components/custom_text_field.dart';
import '../../../base/components/reusable_date_picker_field.dart';
import '../../../base/widgets/app_bar.dart';
import '../../../base/widgets/app_custom_textfield.dart';
import '../../../base/widgets/app_floating_button.dart';
import '../../../base/widgets/note_textfield.dart';
import '../../../base/widgets/time_picker.dart';

class AddFormulaPage extends StatelessWidget {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final TextEditingController _weightTEController = TextEditingController();
  final TextEditingController _noteTEController = TextEditingController();
  final List<DropdownItem<String>> countries = <DropdownItem<String>>[
    const DropdownItem(value: 'cow_milk', label: 'Cow Milk'),
    const DropdownItem(value: 'goat_milk', label: 'Goat Milk'),
    const DropdownItem(value: 'soy_milk', label: 'Soy Milk'),
    const DropdownItem(value: 'other', label: 'Other'),
  ];

  AddFormulaPage({super.key});

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
              const AppBarRegular(title: 'Add Formula'),
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
                            TimePickerWidget(
                              label: 'Time',
                              time: timeController.startLeftTime,
                              onTimeSelected: timeController.updateStartLeftTime,
                            ),

                            const Divider(),
                            SizedBox(height: 12),
                            CustomDropdown<String>(
                              backgroundColor: AppColors.white,
                              dropdownColor: AppColors.pageColor,
                              items: countries,
                              hint: 'Type',
                              dropdownMaxHeight: 250,
                              onChanged: (String? value) {
                                print('Selected searchable country: $value');
                              },
                            ),

                            const SizedBox(height: 12),
                            MyTextFormFieldWithIcon(
                              borderColor: Colors.grey.shade300,
                              keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                              formHintText: 'Weight',
                              controller: _weightTEController,
                              validator: (String? value) {
                                if (value?.isEmpty ?? true) {
                                  return "Don't leave empty";
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 12),

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
