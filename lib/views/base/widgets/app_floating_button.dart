import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';
import '../components/custom_svg.dart';

class AppFloatingButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;

  const AppFloatingButton({super.key, required this.iconPath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          splashColor: Colors.grey.withValues(alpha: 0.2),
          // highlightColor: AppColors.red,
          onTap: onPressed,
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 28,
            child: CustomSvgImage(assetName: iconPath, width: 30, height: 30),
          ),
        ),
      ),
    );
  }
}

class CircleLetter extends StatelessWidget {
  const CircleLetter({super.key, this.radius = 12, this.letter = 'L'});

  final double radius;

  final String letter;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primaryColor,
      child: Text(
        letter,
        style: textTheme.labelMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}