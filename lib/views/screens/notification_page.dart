import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/base/widgets/app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AppBarRegular(title: 'Notification'),
              const SizedBox(height: 12),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.iconBackground,
                      child: CustomSvgImage(
                        assetName: AppIcons.sleepingIcon,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    title: Text(
                      "Sleep Reminder",
                      style: textTheme.displayLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          const SizedBox(height: 8),
                        Text(
                          'Tuba has a sleep activity scheduled at 06.00 PM',
                          style: textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '11-06-2025 05.55 pm',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                },

                separatorBuilder: (BuildContext context, int index) {
                  return   const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
