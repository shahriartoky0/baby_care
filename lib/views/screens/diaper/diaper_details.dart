import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/primary_button.dart';

import '../../../controller/manual_time_controller.dart';
import '../../base/components/custom_dropdown.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/note_textfield.dart';
import '../../base/widgets/time_picker.dart';

class DiaperDetails extends StatelessWidget {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final TextEditingController _noteTEController = TextEditingController();

  DiaperDetails({super.key});

  final List<DropdownItem<String>> skinConditions = <DropdownItem<String>>[
    const DropdownItem(value: 'diaper_rash', label: 'Diaper Rash'),
    const DropdownItem(value: 'eczema', label: 'Eczema (Atopic Dermatitis)'),
    const DropdownItem(value: 'contact_dermatitis', label: 'Contact Dermatitis'),
    const DropdownItem(value: 'ringworm', label: 'Ringworm (Tinea Corporis)'),
    const DropdownItem(value: 'cradle_cap', label: 'Cradle Cap (Seborrheic Dermatitis)'),
    const DropdownItem(value: 'heat_rash', label: 'Heat Rash (Miliaria)'),
    const DropdownItem(value: 'impetigo', label: 'Impetigo'),
    const DropdownItem(value: 'yeast_infections', label: 'Yeast Infections (Candida)'),
    const DropdownItem(value: 'allergic_reactions', label: 'Allergic Reactions'),
  ];

  final List<DropdownItem<String>> diaperConditions = <DropdownItem<String>>[
    const DropdownItem(value: 'dry', label: 'Dry  '),
    const DropdownItem(value: 'wet', label: 'Wet  '),
    const DropdownItem(value: 'mixed', label: 'Mixed'),
    const DropdownItem(value: 'dirty', label: 'Dirty'),
    const DropdownItem(value: 'leaky_diaper', label: 'Leaky'),
    const DropdownItem(value: 'heavy_diaper', label: 'Heavy'),
  ];

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
              const AppBarRegular(title: 'Diaper Log'),
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
                            TimePickerWidget(
                              label: 'Diaper put on',
                              time: timeController.startLeftTime,
                              onTimeSelected: timeController.updateStartLeftTime,
                            ),
                            TimePickerWidget(
                              label: 'Diaper put off',
                              time: timeController.endLeftTime,
                              onTimeSelected: timeController.updateEndLeftTime,
                            ),
                            const Divider(),

                            const SizedBox(height: 12),
                            CustomDropdown<String>(
                              backgroundColor: AppColors.white,
                              dropdownColor: AppColors.pageColor,
                              items: skinConditions,
                              hint: "Baby's skin condition",
                              dropdownMaxHeight: 250,
                              onChanged: (String? value) {
                                print('Selected searchable skin: $value');
                              },
                            ),
                            const SizedBox(height: 12),
                            CustomDropdown<String>(
                              backgroundColor: AppColors.white,
                              dropdownColor: AppColors.pageColor,
                              items: diaperConditions,
                              hint: "Diaper Condition",
                              dropdownMaxHeight: 250,
                              onChanged: (String? value) {
                                print('Selected searchable skin: $value');
                              },
                            ),
                            const SizedBox(height: 24),
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
