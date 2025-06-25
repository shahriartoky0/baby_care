import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_selector/intl_phone_selector.dart';
import 'package:together_baby/views/screens/auth/sign_in_page.dart';
import 'package:together_baby/views/screens/auth/sign_up_second_page.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../../utilities/images/app_images.dart';
import '../../base/components/custom_text.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/widgets/app_custom_textfield.dart';
import '../../base/widgets/custom_appbar.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();

  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  String initialCountry = 'US';
  bool isValidNumber = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(32, 8, 32, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(AppImages.authLogoImage),
                      const SizedBox(height: 12),
                      Text("Sign Up With Email", style: Theme.of(context).textTheme.titleMedium),

                      const SizedBox(height: 14),
                      Text(
                        'Please enter your details.',
                        style: Theme.of(
                          context,
                        ).textTheme.displayMedium?.copyWith(color: AppColors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 32),
                      Text(AppString.userName, style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 14),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          formHintText: 'Enter Username',
                          prefixIcon: const Icon(
                            Icons.account_circle_rounded,
                            color: AppColors.primaryColor,
                          ),
                          controller: _userNameTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} name !!';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16),

                      Text(AppString.yourEmail, style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 14),

                      MyTextFormFieldWithIcon(
                        formHintText: AppString.enterEmail,
                        prefixIcon: const Icon(Icons.mail, color: AppColors.primaryColor),
                        controller: _emailTEController,
                        validator: (String? value) {
                          if (value?.isEmpty ?? true) {
                            return '${AppString.pleaseEnterYour} ${AppString.yourEmail}!!';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),
                      Text(
                        AppString.phoneNumber,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 14),

                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          setState(() {
                            this.number = number;
                          });
                        },
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        onInputValidated: (bool value) {
                          setState(() {
                            isValidNumber = value; // Update validation status
                          });
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          setSelectorButtonAsPrefixIcon: true,
                          leadingPadding: 12,
                        ),
                        textFieldController: _phoneTEController,

                        initialValue: number,
                        inputDecoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            // Same borderRadius for consistency
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor, // Apply the primary color
                            ),
                          ),
                          hintText: 'Phone Number',
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
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppString.confirmPassword,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          isPassword: true,
                          formHintText: AppString.confirmPassword,
                          prefixIcon: const Icon(Icons.lock, color: AppColors.primaryColor),
                          controller: _confirmPasswordTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} Password again !!';
                            } else if (value != _passwordTEController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: _isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                _isChecked = newValue ?? false;
                              });
                            },
                            checkColor: AppColors.white,
                            focusColor: AppColors.white,
                            activeColor: AppColors.primaryColor,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isChecked = !_isChecked;
                                });
                              },
                              child: Text(
                                AppString.byCreatingAnAccountIAcceptTheTermsConditions,
                                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: AppColors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                _isChecked
                                    ? AppColors.primaryColor
                                    : AppColors.primaryColor.withValues(alpha: .5),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();

                            if (_isChecked) {
                              setState(() {
                                // clearTextFields(); // Clear fields inside setState to trigger UI refresh
                              });
                              Get.to(() => SignUpSecondPage());
                              // TODO: Sign up logic
                              // if (_formKey.currentState!.validate() && isValidNumber == true) {}
                            }
                          },
                          child: Text(
                            AppString.signUp,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(AppString.alreadyHaveAnAccount),
                            TextButton(
                              onPressed: () {
                                Get.offAll( ()=> const SignInPage());
                              },
                              child: Text(
                                AppString.signIn,
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// ===============> Google Login ============>
                      const SizedBox(height: 12),
                      Center(child: Text('OR', style: Theme.of(context).textTheme.labelSmall)),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () {
                          /// TODO : Google login
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 15,
                            children: <Widget>[
                              Image.asset(AppImages.googleLogoImage),
                              Text(
                                'Sign up with Google',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clearTextFields() {
    _userNameTEController.clear();
    _emailTEController.clear();

    // _phoneTEController.clear();

    _passwordTEController.clear();

    _confirmPasswordTEController.clear();
  }

  @override
  void dispose() {
    _userNameTEController.dispose();
    _emailTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
