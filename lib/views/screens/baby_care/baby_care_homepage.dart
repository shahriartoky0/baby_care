import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/views/screens/baby_care/sound_list.dart';

import '../../../utilities/app_colors.dart';
import '../../base/components/app_icon.dart';
import '../../base/components/custom_svg.dart';
import 'baby_cues.dart';

class BabyCareHomepage extends StatelessWidget {
  const BabyCareHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    const Color borderColor = AppColors.modalIconOuterColor;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: <Widget>[
              Center(child: Text('Baby Care', style: textTheme.titleMedium)),

              SizedBox(height: 16),
              Wrap(
                runSpacing: 10,
                spacing: 8,
                children: [
                  BabyCareContainer(
                    label: 'Baby Cues',
                    iconPath: AppIcons.babyCuesIcon,
                    onTap: () {
                      Get.to(() => FAQPage());
                    },
                  ),
                  BabyCareContainer(
                    label: 'Sound',
                    iconPath: AppIcons.soundIcon,
                    containerColor: AppColors.modalIconOuterColor,
                    onTap: () {
                      Get.to(() => SoundList());
                    },
                  ),
                  BabyCareContainer(
                    label: 'Southing',
                    iconPath: AppIcons.soutingIcon,
                    containerColor: AppColors.modalIconInnerColor,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BabyCareContainer extends StatelessWidget {
  final Color containerColor;

  const BabyCareContainer({
    super.key,
    this.containerColor = AppColors.primaryColor,
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  final Color borderColor = AppColors.modalIconOuterColor;
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width * 0.45,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                width: Get.width * 0.12,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                height: 100,
                decoration: BoxDecoration(
                  color: containerColor,
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
                child: CustomSvgImage(assetName: iconPath),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),

                width: Get.width * 0.4,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      label,
                      style: textTheme.displayMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
