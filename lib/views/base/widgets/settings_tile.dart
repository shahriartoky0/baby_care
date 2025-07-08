import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';
import '../components/app_icon.dart';
import '../components/custom_svg.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key, required this.label, required this.iconPath, required this.onTap});

  final String label;

  final String iconPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Material(
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.grey,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Column(
            children: <Widget>[
              Row(
                spacing: 8,
                children: <Widget>[
                  CustomSvgImage(
                    assetName: iconPath,
                    color: iconPath == AppIcons.logoutIcon ? Colors.red : AppColors.primaryColor,
                  ),
                  Text(
                    label,
                    style: textTheme.headlineSmall?.copyWith(
                      color: iconPath == AppIcons.logoutIcon ? Colors.red : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  const Icon(CupertinoIcons.right_chevron, size: 18),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}