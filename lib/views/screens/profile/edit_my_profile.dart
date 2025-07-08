import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../base/components/primary_button.dart';
import '../../base/widgets/profile_editable_container.dart';

class EditMyProfile extends StatefulWidget {
  const EditMyProfile({super.key});

  @override
  State<EditMyProfile> createState() => _EditMyProfileState();
}

class _EditMyProfileState extends State<EditMyProfile> {

  // Controllers for the text fields
  final TextEditingController _nameController = TextEditingController(text: 'Carol');
  final TextEditingController _emailController = TextEditingController(text: 'Support@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '01887963328');
  final TextEditingController _relationController = TextEditingController(text: 'Mother');

  @override
  void dispose() {
    // Don't forget to dispose controllers to prevent memory leaks
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _relationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .98,
        child: PrimaryButton(
          buttonText: 'Save',
          onPressed: () {
            _saveProfile();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /// Appbar ===========>
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(CupertinoIcons.back),
                  ),
                  Text('Edit My Profile', style: textTheme.titleMedium),
                  SizedBox(width: 30),
                ],
              ),

              /// Body ============>
              const SizedBox(height: 12),

              /// Image with edit Icon  ==================>


              Container(
                width: MediaQuery.sizeOf(context).width * .9,
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
                    /// =============> Body Content =========>
                    ProfileEditableContainer(
                      label: 'Name',
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                    ),
                    ProfileEditableContainer(
                      label: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    ProfileEditableContainer(
                      label: 'Phone Number',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    ProfileEditableContainer(
                      label: 'Relation to baby',
                      controller: _relationController,
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _saveProfile() {
    // Handle saving profile data
    final profileData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'relation': _relationController.text,
    };

    // You can add your save logic here (API call, local storage, etc.)
    print('Profile Data: $profileData');

    // Show success message
    Get.snackbar('Success', 'Profile updated successfully!', snackPosition: SnackPosition.BOTTOM);
  }
}

