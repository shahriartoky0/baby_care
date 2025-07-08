import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../base/components/primary_button.dart';
import '../../base/widgets/profile_editable_container.dart';

class EditBabyProfile extends StatefulWidget {
  const EditBabyProfile({super.key});

  @override
  State<EditBabyProfile> createState() => _EditBabyProfileState();
}

class _EditBabyProfileState extends State<EditBabyProfile> {
  // Controllers for the text fields
  final TextEditingController _nameController = TextEditingController(text: 'Maliha tuba');
  final TextEditingController _dateController = TextEditingController(text: '25-May-2025, 11:08 AM');
  final TextEditingController _weightController = TextEditingController(text: '3.5 Pound');
  final TextEditingController _heightController = TextEditingController(text: '15.00 Feet');

  @override
  void dispose() {
    // Don't forget to dispose controllers to prevent memory leaks
    _nameController.dispose();
    _dateController.dispose();
    _weightController.dispose();
    _heightController.dispose();
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
                  Text('Edit Baby Profile', style: textTheme.titleMedium),
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
                      label: 'Baby Name',
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                    ),
                    ProfileEditableContainer(label: 'Date of Birth', controller: _dateController),
                    ProfileEditableContainer(
                      label: 'Weight',
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                    ),
                    ProfileEditableContainer(
                      label: 'Height',
                      controller: _heightController,
                      keyboardType: TextInputType.number,
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
      'email': _dateController.text,
      'phone': _weightController.text,
      'relation': _heightController.text,
    };

    // You can add your save logic here (API call, local storage, etc.)
    print('Profile Data: $profileData');

    // Show success message
    Get.snackbar('Success', 'Profile updated successfully!', snackPosition: SnackPosition.BOTTOM);
  }
}
