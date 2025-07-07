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

class AddVaccinePage extends StatefulWidget {
  const AddVaccinePage({super.key});

  @override
  State<AddVaccinePage> createState() => _AddVaccinePageState();
}

class _AddVaccinePageState extends State<AddVaccinePage> {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final List<FoodCategory> mainCategories = FoodCategoriesData.getMainCategories();
  final List<ReactionCategory> reactions = ReactionCategoriesData.reactions;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountTEController = TextEditingController();
  final TextEditingController _noteTEController = TextEditingController();

  final TextEditingController _vaccineDateTEController = TextEditingController();

  // Selected food tracking
  FoodCategory? selectedCategory;
  FoodSubCategory? selectedSubCategory;
  String? customSubCategoryValue;
  String? amount;
  String? reactionName;

  @override
  Widget build(BuildContext context) {
    Get.put(ReminderController());

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
                const AppBarRegular(title: 'Add Vaccine'),

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
                                hintText: 'Vaccine Date',
                                controller: _vaccineDateTEController,
                                color: AppColors.pageColor,
                              ),

                              const SizedBox(height: 12),
                              MyTextFormFieldWithIcon(
                                borderColor: Colors.grey.shade300,
                                keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                                formHintText: 'Vaccine Name',
                                controller: _vaccineDateTEController,
                                validator: (String? value) {
                                  if (value?.isEmpty ?? true) {
                                    return "Enter vaccine name";
                                  }
                                  return null;
                                },
                              ),

                              ///===========> Address =========>
                              const SizedBox(height: 12),
                              MyTextFormFieldWithIcon(
                                borderColor: Colors.grey.shade300,
                                keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                                formHintText: 'Vaccine Venue',
                                controller: _amountTEController,
                                validator: (String? value) {
                                  if (value?.isEmpty ?? true) {
                                    return "Enter the venue";
                                  }
                                  return null;
                                },
                              ),

                              const SizedBox(height: 12),

                              ReminderSwitch(
                                label: 'Remind me 2 Hours before schedule',
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
