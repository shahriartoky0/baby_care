import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utilities/app_colors.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; // Progress as a percentage (0.0 to 1.0)
  final Color progressColor; // Color of the progress bar
  final Color backgroundColor; // Background color of the bar

  // Constructor
  const CustomProgressBar({
    super.key,
    required this.progress,
    this.progressColor = AppColors.primaryColor, // Default green
    this.backgroundColor = AppColors.modalIconInnerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Progress bar container
        Container(
          width: Get.width * 0.35, // Width of the progress bar
          height: 9, // Height of the progress bar
          decoration: BoxDecoration(
            color: backgroundColor, // Background color
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                color: progressColor, // Progress bar color
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),

                  bottomLeft: Radius.circular(12),
                ), // Rounded corners
              ),
            ),
          ),
        ),

        // Skip label
      ],
    );
  }
}