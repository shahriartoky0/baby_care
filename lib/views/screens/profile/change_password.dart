import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:together_baby/views/base/widgets/app_bar.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';
import '../../base/components/custom_text.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/custom_toast.dart';
import '../../base/components/primary_button.dart';
import '../../base/widgets/app_custom_modal.dart';
import '../../base/widgets/app_custom_textfield.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _resetPassTEController = TextEditingController();
  final TextEditingController _confirmPassTeController = TextEditingController();
  final TextEditingController _oldPassTeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppBarRegular(title: 'Change Password'),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(blurRadius: 3, spreadRadius: 2, color: Colors.grey),
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(32, 50, 32, 0),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 32),
                      Text('Old Password', style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 14),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          isPassword: true,
                          formHintText: 'Enter Old Password',
                          prefixIcon: const Icon(Icons.lock, color: AppColors.primaryColor),
                          controller: _oldPassTeController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} Password !!';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 14),
                       Text('New Password', style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: 14),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          isPassword: true,
                          formHintText: 'Enter New Password',
                          prefixIcon: const Icon(Icons.lock, color: AppColors.primaryColor),
                          controller: _resetPassTEController,
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
                      const SizedBox(height: 14),
                      AppCustomContainerField(
                        containerChild: MyTextFormFieldWithIcon(
                          isPassword: true,
                          formHintText: AppString.confirmPassword,
                          prefixIcon: const Icon(Icons.lock, color: AppColors.primaryColor),
                          controller: _confirmPassTeController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return '${AppString.pleaseEnterYour} Password again !!';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(height: 32),
                      PrimaryButton(
                        buttonText: 'Change Password',
                        // Text that will appear on the button
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          clearingTextField();
                          if (_resetPassTEController.text.trim() !=
                              _confirmPassTeController.text.trim()) {
                            ToastManager.show(
                              message: AppString.passwordsDoNotMatch,
                              backgroundColor: AppColors.red,
                              textColor: Colors.white,
                              animationDuration: const Duration(milliseconds: 500),
                              animationCurve: Curves.easeInSine,
                              duration: const Duration(seconds: 1),
                            );
                            return;
                          }
                          // TODO: password Reset logic
                          // if (_formKey.currentState!.validate()) {}
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ), // Curved top border
                            ),
                            builder: (BuildContext context) {
                              return const AppCustomModal();
                            },
                          ).whenComplete(() {
                            // This callback is called when the modal is dismissed
                            FocusScope.of(context).unfocus();
                          });
                        },
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

  void clearingTextField() {
    _resetPassTEController.clear();
    _confirmPassTeController.clear();
  }

  @override
  void dispose() {
    _confirmPassTeController.dispose();
    _resetPassTEController.dispose();
    super.dispose();
  }
}
