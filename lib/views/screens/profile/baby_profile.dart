import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/utilities/app_colors.dart';
import '../../base/components/custom_cached_image.dart';
import '../../base/widgets/upload_photo_diaologe.dart';
import 'edit_baby_profile.dart';
import 'edit_my_profile.dart';

class BabyProfile extends StatefulWidget {
  const BabyProfile({super.key});

  @override
  State<BabyProfile> createState() => _BabyProfileState();
}

class _BabyProfileState extends State<BabyProfile> {
  File? _image; // Variable to hold the selected image

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(CupertinoIcons.back),
                  ),
                  Text(' Baby Profile', style: textTheme.titleMedium),
                  IconButton(
                    onPressed: () {
                      Get.to(() => EditBabyProfile());
                    },
                    icon: const Icon(
                      CupertinoIcons.square_pencil_fill,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),

              /// Body ============>
              const SizedBox(height: 12),

              /// Image with edit Icon  ==================>
              InkWell(
                onTap: () async {
                  final File? selectedImage = await showUploadPhotoDialog(context);
                  if (selectedImage != null) {
                    setState(() {
                      _image = selectedImage;
                    });
                  }
                },
                child: SizedBox(
                  height: 120,
                  child: Stack(
                    // alignment: Alignment.topRight,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryColor, // Border color
                            width: 2, // Border width
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child:
                          _image != null
                              ? Image.file(_image!, fit: BoxFit.cover, width: 100, height: 100)
                              : const CustomCachedImage(
                            // imageUrl: "${AppUrl.baseUrl}${user.image ?? ''}",
                            imageUrl: '',
                          ),
                        ),
                      ),
                      // Edit icon inside a box, positioned at the bottom-right
                      Positioned(
                        bottom: 20,
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            final File? selectedImage = await showUploadPhotoDialog(context);
                            if (selectedImage != null) {
                              setState(() {
                                _image = selectedImage;
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

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
                child: const Column(
                  children: <Widget>[
                    /// =============> Body Content =========>
                ProfileCommonContainer(label: 'Gender', bodyText: 'Girl'),
                ProfileCommonContainer(label: 'Baby Name', bodyText: 'Maliha Tuba'),
                ProfileCommonContainer(label: 'Date of Birth', bodyText: '25-May-2025, 11:08 AM'),
                ProfileCommonContainer(label: 'Baby Weight', bodyText: '3.5 Pound'),
                ProfileCommonContainer(label: 'Baby Height', bodyText: '15.00 Feet'),
                ProfileCommonContainer(label: 'Blood Group', bodyText: 'B+'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<File?> showUploadPhotoDialog(BuildContext context) async {
    final File? selectedImage = await showDialog<File?>(
      context: context,
      builder: (BuildContext context) => const UploadPhotoDialog(),
    );
    return selectedImage;
  }
}

class ProfileCommonContainer extends StatelessWidget {
  const ProfileCommonContainer({super.key, required this.label, required this.bodyText});

  final String label;

  final String bodyText;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: MediaQuery.sizeOf(context).width * .9,

      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 1, color: Colors.grey)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(bodyText, style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
