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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.primaryColor.withValues(alpha: 0.4)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),

          // To ensure the border has rounded corners
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
              child: Row(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(buttonLabels.length, (int index) {
                  return GestureDetector(
                    onTap: () {
                      controller.updateSelectedIndex(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.sizeOf(context).width * 0.25,
                      ),
                       // width: Get.width * 0.25,
                      // margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                            color:
                                controller.selectedIndex.value == index
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      );
    });
  }
}

/*
SelectButtonWidget(
buttonLabels: const <String>['Month 01', 'Month 02', 'Month 03', 'Month 04'],
controller: controller,
),
SizedBox(height: 12),
Obx(() {
switch (controller.selectedIndex.value) {
case 0:
return Text('Month 01 Milestone');
case 1:
return Text('Month 02 Milestone');
case 2:
return Text('Month 03 Milestone');
case 3:
return Text('Month 04 Milestone');
default:
return const Text("Select an option", style: TextStyle(fontSize: 20));
}
}),*/
