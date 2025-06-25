import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../screens/auth/sign_in_page.dart';
import '../components/primary_button.dart';

class AppCustomModal extends StatelessWidget {
  const AppCustomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.pageColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 8), // Spacer
            Container(
              height: 6,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.modalHandleColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 32),

            CircleAvatar(
              radius: 72,
              backgroundColor: AppColors.modalIconOuterColor,
              child: CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.modalIconInnerColor,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.modalIconInnerColor,
                  child: CustomSvgImage(assetName: AppIcons.thumbIcon, width: 24, height: 24),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(AppString.passwordChanged, style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 10),
            Text(
              AppString.returnToTheLoginPageToEnterYourAccountWithYourNewPassword,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            PrimaryButton(
              buttonText: AppString.confirm,
              // Text that will appear on the button
              onPressed: () {
                Get.offAll(() => const SignInPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
