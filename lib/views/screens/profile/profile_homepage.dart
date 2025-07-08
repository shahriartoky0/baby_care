import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/screens/profile/my_profile.dart';
import '../../base/widgets/profile_top_card.dart';
import '../../base/widgets/settings_tile.dart';
import 'baby_profile.dart';

class ProfileHomepage extends StatelessWidget {
  const ProfileHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /// Appbar ===========>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('Profile', style: textTheme.titleMedium)],
              ),

              /// Body ============>
              const SizedBox(height: 12),
              const CircleAvatar(
                backgroundColor: AppColors.modalIconOuterColor,
                radius: 48,
                child: Icon(CupertinoIcons.person, size: 42, color: AppColors.primaryColor),
              ),
              const SizedBox(height: 8),
              Text('Carole K. Strand', style: textTheme.headlineMedium),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: <Widget>[
                  ProfileTopCard(
                    iconPath: AppIcons.profileIcon,
                    title: 'My Profile',
                    subtitle: 'Manage your profile and setting',
                    onPressed: () {
                      Get.to(() => const MyProfile());
                    },
                  ),
                  ProfileTopCard(
                    iconPath: AppIcons.navBabyIcon,
                    title: 'Baby Profile',
                    subtitle: 'Manage your profile and setting',
                    onPressed: () {
                      Get.to(() => const BabyProfile());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                  boxShadow: <BoxShadow>[const BoxShadow(blurRadius: 3, color: Colors.grey)],
                ),
                child: Column(
                  children: <Widget>[
                    SettingsTile(label: 'Memories', iconPath: AppIcons.memoryIcon, onTap: () {}),
                    SettingsTile(label: 'Baby Memories', iconPath: AppIcons.bookIcon, onTap: () {}),
                    SettingsTile(
                      label: 'Change Password',
                      iconPath: AppIcons.keyIcon,
                      onTap: () {},
                    ),
                    SettingsTile(
                      label: 'Privacy policy',
                      iconPath: AppIcons.privacyIcon,
                      onTap: () {},
                    ),
                    SettingsTile(
                      label: 'Terms & conditions',
                      iconPath: AppIcons.termsIcon,
                      onTap: () {},
                    ),
                    SettingsTile(
                      label: 'About us',
                      iconPath: AppIcons.informationIcon,
                      onTap: () {},
                    ),
                    SettingsTile(label: 'Logout', iconPath: AppIcons.logoutIcon, onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
