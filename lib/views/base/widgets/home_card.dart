import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utilities/app_colors.dart';
import '../components/app_icon.dart';
import '../components/custom_svg.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.textTheme,
    required this.cardTitle,
    required this.history1,
    required this.history1Data,
    required this.history2,
    required this.history2Data,
    required this.iconPath,
    required this.addPressed,
    required this.cardInnerColor,
    this.borderColor = AppColors.modalIconOuterColor,
    required this.iconPressed,
    this.iconSize = 26,
  });

  final TextTheme textTheme;
  final String cardTitle;
  final String history1;
  final String history1Data;
  final String history2;
  final String history2Data;
  final String iconPath;
  final VoidCallback addPressed;
  final VoidCallback iconPressed;
  final Color cardInnerColor;
  final double iconSize;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.45,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              width: Get.width * 0.35,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ), // Rounded
                border: Border(
                  top: BorderSide(color: borderColor, width: 2.0),
                  left: BorderSide(color: borderColor, width: 2.0),
                  bottom: BorderSide(color: borderColor, width: 2.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(cardTitle, style: textTheme.displayLarge?.copyWith()),
                  const SizedBox(height: 8),
                  Text(history1, style: textTheme.displaySmall),
                  Text(history1Data, style: textTheme.bodyMedium?.copyWith(color: AppColors.grey)),
                  const SizedBox(height: 12),
                  Text(history2, style: textTheme.displaySmall),
                  Text(history2Data, style: textTheme.bodyMedium?.copyWith(color: AppColors.grey)),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
              width: Get.width * 0.15,

              height: 150,
              decoration: BoxDecoration(
                color: cardInnerColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ), // Rounded
                border: Border(
                  right: BorderSide(color: borderColor, width: 2.0),
                  top: BorderSide(color: borderColor, width: 2.0),
                  bottom: BorderSide(color: borderColor, width: 2.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Material(
                    color: cardInnerColor,
                    child: InkWell(
                      splashColor: AppColors.primaryColor,
                      onTap: iconPressed,
                      child: CustomSvgImage(
                        assetName: iconPath,
                        width: iconSize,
                        height: iconSize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Material(
                    color: cardInnerColor,
                    child: InkWell(
                      splashColor: AppColors.primaryColor,
                      onTap: addPressed,
                      child: CustomSvgImage(
                        assetName: AppIcons.addIcon,
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}