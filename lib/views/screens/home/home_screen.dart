import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/utilities/images/app_images.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';

import '../../base/components/image_carousel.dart';
import '../../base/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Image.asset(AppImages.homeUserIcon),
                title: Text('Maliha Tuba', style: textTheme.headlineMedium),
                subtitle: Text('3 days', style: textTheme.labelSmall),
                trailing: CircleAvatar(
                  backgroundColor: AppColors.modalIconInnerColor,
                  radius: 16,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.bell_fill, size: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // ImageSlider(
              //   imgList: [AppImages.homeBannerImage, AppImages.upgradePlanImage],
              //   buttonPress: [() {}, () {}],
              // ),
              ImageSlider(
                imgList: <String>[AppImages.homeBannerImage, AppImages.upgradePlanImage],
                height: 220,
              ),
              const SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: <Widget>[
                  HomeCard(
                    textTheme: textTheme,
                    cardTitle: 'Feeding',
                    history1: 'Last Fed',
                    history1Data: '__',
                    history2: 'Breast',
                    history2Data: '__',
                    iconPath: AppIcons.feedingIcon,
                    addPressed: () {},
                    cardInnerColor: AppColors.feedCardColor,
                    iconPressed: () {},
                  ),
                  HomeCard(
                    textTheme: textTheme,
                    cardTitle: 'Pumping',
                    history1: 'Last Pumped',
                    history1Data: '__',
                    history2: 'Duration',
                    history2Data: '__',
                    iconPath: AppIcons.pumpingIcon,
                    addPressed: () {},
                    cardInnerColor: AppColors.pumpCardColor,
                    iconPressed: () {},
                    iconSize: 32,
                  ),
                  HomeCard(
                    textTheme: textTheme,
                    cardTitle: 'Diaper',
                    history1: 'Last Changed',
                    history1Data: '__',
                    history2: 'Duration',
                    history2Data: '__',
                    iconPath: AppIcons.diaperIcon,
                    addPressed: () {},
                    cardInnerColor: AppColors.diaperCardColor,
                    iconPressed: () {},
                  ),
                  HomeCard(
                    textTheme: textTheme,
                    cardTitle: 'Sleep',
                    history1: 'Awoke',
                    history1Data: '__',
                    history2: 'Duration',
                    history2Data: '__',
                    iconPath: AppIcons.sleepingIcon,
                    addPressed: () {},
                    cardInnerColor: AppColors.sleepCardColor,
                    iconPressed: () {},
                  ),
                  HomeCard(
                    textTheme: textTheme,
                    cardTitle: 'Medicine',
                    history1: 'Last Taken',
                    history1Data: '__',
                    history2: 'At',
                    history2Data: '__',
                    iconPath: AppIcons.medicineIcon,
                    addPressed: () {},
                    cardInnerColor: AppColors.medicineCardColor,
                    iconPressed: () {},
                  ),
                  HomeCard(
                    textTheme: textTheme,
                    cardTitle: 'Vaccine',
                    history1: 'Last Given',
                    history1Data: '__',
                    history2: 'On',
                    history2Data: '__',
                    iconPath: AppIcons.vaccineIcon,
                    addPressed: () {},
                    cardInnerColor: AppColors.vaccineCardColor,
                    iconPressed: () {},
                  ),
                  HomeCard(
                    textTheme: textTheme,
                    cardTitle: 'Growth',
                    history1: 'KG',
                    history1Data: '__',
                    history2: 'As on',
                    history2Data: '__',
                    iconPath: AppIcons.growthIcon,
                    addPressed: () {},
                    cardInnerColor: AppColors.growCardColor,
                    iconPressed: () {},
                  ),
                  HomeCard(
                    textTheme: textTheme,
                    cardTitle: 'Milestone',
                    history1: 'Last Reached',
                    history1Data: '__',
                    history2: 'Baby is born',
                    history2Data: '__',
                    iconPath: AppIcons.milestoneIcon,
                    addPressed: () {},
                    cardInnerColor: AppColors.milestoneCardColor,
                    iconPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Stack(
                children: <Widget>[
                  CustomSvgImage(assetName: AppImages.bottomBannerCard, height: 170),
                  Positioned(
                    bottom: 8,
                    left: 10,
                    child: InkWell(
                      onTap: () {
                        /// TODO : navigate Logic
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColor,
                        ),
                        child: Text(
                          'Read More',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 11),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
