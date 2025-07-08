import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';
import '../components/custom_svg.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.showButton = false,
    this.buttonPressed,
  });

  final String iconPath;

  final String title;

  final String subtitle;
  final bool showButton;
  final VoidCallback? buttonPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primaryColor.withValues(alpha: 0.7)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(offset: Offset(0, 0), color: Colors.grey, blurRadius: 2, spreadRadius: 1),
        ],
      ),
      child: Row(
        spacing: 8,
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: CustomSvgImage(assetName: iconPath, color: AppColors.white, height: 22),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: textTheme.headlineMedium),
              Text(subtitle, style: textTheme.labelSmall),
            ],
          ),
          if (showButton) ...<Widget>[
            const Spacer(),
            IconButton(
              onPressed:buttonPressed,
              icon: const Icon(
                CupertinoIcons.minus_circle_fill,
                color: AppColors.feedCardColor,
                size: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
