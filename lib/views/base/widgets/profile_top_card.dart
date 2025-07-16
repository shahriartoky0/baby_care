import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';
import '../components/custom_svg.dart';

class ProfileTopCard extends StatelessWidget {
  const ProfileTopCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String iconPath;

  final String title;
  final VoidCallback onPressed;

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 1),
              // spreadRadius: 2,
              blurRadius: 3,
              color: Colors.grey,
            ),
          ],
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.modalIconInnerColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomSvgImage(assetName: iconPath, color: AppColors.primaryColor, height: 24),
            const SizedBox(height: 4),
            Text(title, style: textTheme.headlineMedium),
            const SizedBox(height: 4),
            Text(subtitle, style: textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
