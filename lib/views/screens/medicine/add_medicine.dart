// models/food_category.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import '../../../../controller/manual_time_controller.dart';
import '../../../../data/food/food_categories.dart';
import '../../../../model/food/food_category.dart';
import '../../base/components/custom_dropdown.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/custom_toast.dart';
import '../../base/components/primary_button.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/components/switch_with_controller.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/note_textfield.dart';
import '../feeding/breastfeeding/breast_feeding_time_saving.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({super.key});

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final List<FoodCategory> mainCategories = FoodCategoriesData.getMainCategories();
  final List<ReactionCategory> reactions = ReactionCategoriesData.reactions;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountTEController = TextEditingController();
  final TextEditingController _durationTEController = TextEditingController();
  final TextEditingController _noteTEController = TextEditingController();
  final List<DropdownItem<String>> countries = <DropdownItem<String>>[
    const DropdownItem(value: 'tb', label: 'Table Spoon'),
    const DropdownItem(value: 'tablet', label: 'Tablet'),
  ];
  final List<DropdownItem<String>> timeOptions = <DropdownItem<String>>[
    const DropdownItem(value: 'before_breakfast', label: 'Before Breakfast'),
    const DropdownItem(value: 'after_breakfast', label: 'After Breakfast'),
    const DropdownItem(value: 'before_lunch', label: 'Before Lunch'),
    const DropdownItem(value: 'after_lunch', label: 'After Lunch'),
    const DropdownItem(value: 'before_dinner', label: 'Before Dinner'),
    const DropdownItem(value: 'after_dinner', label: 'After Dinner'),
    const DropdownItem(value: 'bedtime', label: 'At Bedtime'),
    const DropdownItem(value: 'wakeup', label: 'After Sleep'),
  ];

  final TextEditingController _medicineDateTEController = TextEditingController();

  // Selected food tracking
  FoodCategory? selectedCategory;
  FoodSubCategory? selectedSubCategory;
  String? customSubCategoryValue;
  String? amount;
  String? reactionName;

  @override
  Widget build(BuildContext context) {
    Get.put(ReminderController());
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .98,
        child: PrimaryButton(buttonText: 'Save', onPressed: () {}),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const AppBarRegular(title: 'Add Medicine'),

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
                                hintText: 'Medicine Start Date',
                                controller: _medicineDateTEController,
                                color: AppColors.pageColor,
                              ),

                              const SizedBox(height: 12),
                              MyTextFormFieldWithIcon(
                                borderColor: Colors.grey.shade300,
                                keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                                formHintText: 'Medicine Name',
                                controller: _medicineDateTEController,
                                validator: (String? value) {
                                  if (value?.isEmpty ?? true) {
                                    return "Enter medicine name";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),

                              CustomDropdown<String>(
                                // isRequired: true,
                                // initialValue: 'after',
                                backgroundColor: AppColors.white,
                                dropdownColor: AppColors.pageColor,
                                items: timeOptions,
                                hint: 'Select Medicine Intake Type',
                                dropdownMaxHeight: 250,
                                onChanged: (String? value) {
                                  print('Selected searchable country: $value');
                                  amount = value;
                                  setState(() {});
                                },
                                validator: (String? value) {
                                  if (value == null) return 'Please select a type';
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),

                              CustomDropdown<String>(
                                // isRequired: true,
                                backgroundColor: AppColors.white,
                                dropdownColor: AppColors.pageColor,
                                items: countries,
                                hint: 'Select Medicine Type',
                                dropdownMaxHeight: 250,
                                onChanged: (String? value) {
                                  print('Selected searchable country: $value');
                                },
                                validator: (String? value) {
                                  if (value == null) return 'Please select a type';
                                  return null;
                                },
                              ),

                              ///===========> Amount of the food =========>
                              const SizedBox(height: 12),
                              MyTextFormFieldWithIcon(
                                borderColor: Colors.grey.shade300,
                                keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                                formHintText: 'Medicine Amount',
                                controller: _amountTEController,
                                validator: (String? value) {
                                  if (value?.isEmpty ?? true) {
                                    return "Enter an amount";
                                  }
                                  return null;
                                },
                              ),

                              ///===========> Reaction of the food =========>
                              const SizedBox(height: 12),
                              Row(
                                children: <Widget>[
                                  Text(' Duration: ', style: textTheme.headlineMedium),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: MyTextFormFieldWithIcon(
                                      borderColor: Colors.grey.shade300,
                                      keyBoardType: const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                      formHintText: 'Medicine Duration (in Days)',
                                      controller: _durationTEController,
                                      validator: (String? value) {
                                        if (value?.isEmpty ?? true) {
                                          return "Enter an amount";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              ReminderSwitch(
                                label: 'Remind me 5 mins before schedule',
                                onChange: () {},
                              ),
                              const SizedBox(height: 12),
                              NoteTextField(noteTEController: _noteTEController),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
