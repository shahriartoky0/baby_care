// widgets/food_subcategory_modal.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/food/food_category.dart';
import '../../../utilities/app_colors.dart';

class FoodSubCategoryModal extends StatefulWidget {
  final FoodCategory category;
  final Function(FoodSubCategory, String?) onSubCategorySelected;

  const FoodSubCategoryModal({
    super.key,
    required this.category,
    required this.onSubCategorySelected,
  });

  @override
  State<FoodSubCategoryModal> createState() => _FoodSubCategoryModalState();
}

class _FoodSubCategoryModalState extends State<FoodSubCategoryModal> {
  FoodSubCategory? selectedSubCategory;
  TextEditingController customTextController = TextEditingController();
  bool showCustomInput = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  widget.category.imagePath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Select ${widget.category.label}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Subcategory Grid
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: widget.category.subCategories.length,
              itemBuilder: (BuildContext context, int index) {
                final FoodSubCategory subCategory = widget.category.subCategories[index];
                final bool isSelected = selectedSubCategory?.id == subCategory.id;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSubCategory = subCategory;
                      showCustomInput = subCategory.isCustom;
                      if (!subCategory.isCustom) {
                        customTextController.clear();
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? AppColors.feedCardColor : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: isSelected ? AppColors.feedCardColor : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        subCategory.label,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 14,
                          color: isSelected ? AppColors.white : Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Custom Input Field
          if (showCustomInput) ...<Widget>[
            const SizedBox(height: 16),
            TextField(
              controller: customTextController,
              decoration: InputDecoration(
                hintText: 'Enter  ${widget.category.label.toLowerCase()} name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                prefixIcon: const Icon(CupertinoIcons.create_solid, color: AppColors.black),
              ),
              autofocus: true,
            ),
          ],

          const SizedBox(height: 20),

          // Action Buttons
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed:
                      selectedSubCategory != null
                          ? () {
                            final String? customValue =
                                showCustomInput && customTextController.text.isNotEmpty
                                    ? customTextController.text
                                    : null;

                            if (showCustomInput && (customValue == null || customValue.isEmpty)) {
                              // Show validation error
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please enter a custom value')),
                              );
                              return;
                            }

                            widget.onSubCategorySelected(selectedSubCategory!, customValue);
                            Navigator.pop(context);
                          }
                          : null,
                  child: Text('Select', style: Theme.of(context).textTheme.labelMedium),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
