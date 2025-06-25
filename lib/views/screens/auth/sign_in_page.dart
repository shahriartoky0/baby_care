import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:together_baby/utilities/images/app_images.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/base/widgets/text_underline.dart';
import 'package:together_baby/views/screens/auth/sign_up_page.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../base/components/custom_text.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/primary_button.dart';
import '../../base/widgets/app_custom_textfield.dart';
import 'forgot_password_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailTEController = TextEditingController();

  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(32, 108, 32, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(AppImages.authLogoImage),
                  const SizedBox(height: 12),
                  Text(
                    'Sign in to your account',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 14),
                  Text(
                    AppString.welcomeBackPleaseEnterYourDetails,
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(color: AppColors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 32),
                  Text(AppString.email, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 14),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      formHintText: AppString.enterEmail,
                      prefixIcon: const Icon(Icons.mail, color: AppColors.primaryColor),
                      controller: _emailTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} ${AppString.email}!!';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        // print("Email Input: $value");
                      },
                    ),
                  ),

                  const SizedBox(height: 16),
                  Text(AppString.password, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 14),
                  AppCustomContainerField(
                    containerChild: MyTextFormFieldWithIcon(
                      isPassword: true,
                      formHintText: AppString.enterPassword,
                      prefixIcon: const Icon(Icons.lock, color: AppColors.primaryColor),
                      controller: _passwordTEController,
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return '${AppString.pleaseEnterYour} Password !!';
                        }
                        return null;
                      },

                      onChanged: (String value) {
                        // print("Email Input: $value");
                      },
                    ),
                  ),

                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Get.to(const ForgotPasswordScreen());
                        },
                        child: Text(
                          AppString.forgotPassword,
                          style: Theme.of(
                            context,
                          ).textTheme.displayMedium?.copyWith(color: AppColors.black,decoration: TextDecoration.underline),
                          textAlign: TextAlign.end,

                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  PrimaryButton(
                    buttonText: AppString.signIn,
                    // Text that will appear on the button
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      clearingTextField(); // Your text clearing function
                    },
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(AppString.dontHaveAnAccount),
                        TextButton(
                          onPressed: () {
                            Get.to(const SignUpPage());
                          },
                          child: Text(
                            AppString.signUp,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineMedium?.copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // validate Email Address
  String? isEmailValid(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void clearingTextField() {
    _emailTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
