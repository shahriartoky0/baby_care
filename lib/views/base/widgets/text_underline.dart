import 'package:flutter/material.dart';
import '../../../utilities/app_colors.dart';

class AppTextUnderline extends StatelessWidget {
  final double width;

  const AppTextUnderline({super.key, this.width = 60});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Divider(thickness: 3, color: AppColors.primaryColor, height: 0),
    );
  }
}
