import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/button_controller.dart';
import '../../../utilities/app_colors.dart';

class SelectButtonWidget extends StatelessWidget {
  final List<String> buttonLabels;
  final ButtonController controller;

  const SelectButtonWidget({super.key, required this.buttonLabels, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.primaryColor.withValues(alpha: 0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(buttonLabels.length, (int index) {
            return GestureDetector(
              onTap: () {
                controller.updateSelectedIndex(index);
              },
              child: Container(
                height: 35,
                width: Get.width * 0.25,
                // margin: const EdgeInsets.symmetric(horizontal: 8),
                // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color:
                  controller.selectedIndex.value == index
                      ? AppColors
                      .primaryColor // Active button color
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1.5,
                    color:
                    controller.selectedIndex.value == index
                        ? AppColors.primaryColor
                        : Colors.grey,
                  ),
                ),
                child: Center(
                  child: Text(
                    buttonLabels[index],
                    style: TextStyle(
                      color: controller.selectedIndex.value == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}