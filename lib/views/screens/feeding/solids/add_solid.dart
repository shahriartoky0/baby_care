// models/food_category.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';

import '../../../../controller/manual_time_controller.dart';
import '../../../../data/food/food_categories.dart';
import '../../../../model/food/food_category.dart';
import '../../../base/components/custom_dropdown.dart';
import '../../../base/components/custom_text_field.dart';
import '../../../base/components/custom_toast.dart';
import '../../../base/components/primary_button.dart';
import '../../../base/widgets/app_bar.dart';
import '../../../base/widgets/food_category_modal.dart';
import '../../../base/widgets/food_label.dart';
import '../../../base/widgets/note_textfield.dart';
import '../../../base/widgets/time_picker.dart';

class AddSolidPage extends StatefulWidget {
  const AddSolidPage({super.key});

  @override
  State<AddSolidPage> createState() => _AddSolidPageState();
}

class _AddSolidPageState extends State<AddSolidPage> {
  final ManualTimeController timeController = Get.put(ManualTimeController());
  final List<FoodCategory> mainCategories = FoodCategoriesData.getMainCategories();
  final List<ReactionCategory> reactions = ReactionCategoriesData.reactions;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountTEController = TextEditingController();
  final TextEditingController _noteTEController = TextEditingController();
  final List<DropdownItem<String>> countries = <DropdownItem<String>>[
    const DropdownItem(value: 'ml', label: 'ML'),
    const DropdownItem(value: 'cup', label: 'Cup'),
    const DropdownItem(value: 'gm', label: 'Gram'),
  ];

  // Selected food tracking
  FoodCategory? selectedCategory;
  FoodSubCategory? selectedSubCategory;
  String? customSubCategoryValue;
  String? amount;
  String? reactionName;

  void _showSubCategoryModal(FoodCategory category) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (BuildContext context) => Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: FoodSubCategoryModal(
              category: category,
              onSubCategorySelected: (FoodSubCategory subCategory, String? customValue) {
                setState(() {
                  selectedCategory = category;
                  selectedSubCategory = subCategory;
                  customSubCategoryValue = customValue;
                });
              },
            ),
          ),
    );
  }

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
            // Handle save with selected category and subcategory
            if (selectedCategory != null && selectedSubCategory != null && reactionName != null) {
              if (_formKey.currentState!.validate()) {
                final Map<String, Object?> foodSelection = <String, Object?>{
                  'category': selectedCategory!.label,
                  'subCategory':
                      selectedSubCategory!.isCustom
                          ? customSubCategoryValue
                          : selectedSubCategory!.label,
                  'time': timeController.startLeftTime.value,
                  'note': _noteTEController.text,
                  'amount': _amountTEController.text,
                  'amountType': amount,
                };

                // Save logic here
                print('Saving food: $foodSelection');
              }
            } else {
              ToastManager.show(
                message: "Please Select a solid food category",
                icon: const Icon(Icons.info_outline, color: Colors.red),
                backgroundColor: AppColors.white,
                textColor: Colors.red,
                animationDuration: const Duration(milliseconds: 500),
                animationCurve: Curves.easeInSine,
                duration: const Duration(seconds: 2),
              );
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const AppBarRegular(title: 'Add Solid'),

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
                                label: 'Time',
                                time: timeController.startLeftTime,
                                onTimeSelected: timeController.updateStartLeftTime,
                              ),
                              const SizedBox(height: 24),
                              Text('Food Category', style: textTheme.headlineMedium),
                              const SizedBox(height: 12),

                              // Main Categories
                              SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: mainCategories.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final FoodCategory category = mainCategories[index];
                                    final bool isSelected = selectedCategory?.id == category.id;

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 3),
                                      child: FoodLabel(
                                        label: category.label,
                                        iconPath: category.imagePath,
                                        isSelected: isSelected,
                                        onTap: () => _showSubCategoryModal(category),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // Selected Food Display
                              if (selectedCategory != null &&
                                  selectedSubCategory != null) ...<Widget>[
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    // color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(8),
                                    // border: Border.all(color: Colors.blue.shade200),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        CupertinoIcons.check_mark_circled_solid,
                                        color: AppColors.primaryColor,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          'Selected food : ${selectedCategory?.label} (${selectedSubCategory!.isCustom ? customSubCategoryValue : selectedSubCategory!.label})',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium?.copyWith(
                                            fontSize: 20,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],

                              const SizedBox(height: 16),
                              CustomDropdown<String>(
                                isRequired: true,
                                initialValue: 'gm',
                                backgroundColor: AppColors.white,
                                dropdownColor: AppColors.pageColor,
                                items: countries,
                                hint: 'Amount Type',
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

                              ///===========> Amount of the food =========>
                              const SizedBox(height: 12),
                              MyTextFormFieldWithIcon(
                                borderColor: Colors.grey.shade300,
                                keyBoardType: const TextInputType.numberWithOptions(decimal: true),
                                formHintText: 'Amount',
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
                              SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: reactions.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final ReactionCategory reaction = reactions[index];

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                      child: FoodLabel(
                                        label: reaction.label,
                                        iconPath: reaction.imagePath,
                                        isSelected: reactionName == reaction.id,
                                        onTap: () {
                                          reactionName = reaction.id;
                                          setState(() {});
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),

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
