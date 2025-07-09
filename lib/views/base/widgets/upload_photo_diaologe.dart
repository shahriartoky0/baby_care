import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/app_strings.dart';

class UploadPhotoDialog extends StatefulWidget {
  final bool forVideo;

  const UploadPhotoDialog({super.key, this.forVideo = false});

  @override
  State createState() => _UploadPhotoDialogState();
}

class _UploadPhotoDialogState extends State<UploadPhotoDialog> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.forVideo ? 'Upload your video' : 'Upload your photo',
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: _pickImage,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                dashPattern: <double>[8, 4],
                color: AppColors.primaryColor,
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.iconBackground,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: AppColors.primaryColor),
                  ),
                  child:
                      _image == null
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.cloud_upload_outlined,
                                size: 40,
                                color: AppColors.black,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Browse Device Gallery',
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  color: AppColors.grey.withValues(alpha: 0.7),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.forVideo
                                    ? 'Format: .mp4 , .mov  & Max file size: 100 MB'
                                    : 'Format: .jpeg, .png & Max file size: 25 MB',
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  color: AppColors.grey.withValues(alpha: 0.4),
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: 150,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(color: AppColors.primaryColor),
                                    ),
                                  ),
                                  onPressed: _pickImage,
                                  child: Text(
                                    'Browse Files',
                                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_image!, fit: BoxFit.cover),
                          ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: AppColors.grey.withValues(alpha: 0.2), width: 0.2),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    backgroundColor: AppColors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  ),
                  onPressed: () {
                    if (_image != null) {
                      Navigator.of(context).pop(_image); // Return the image
                    } else {
                      Navigator.of(context).pop(); // Return null if nothing selected
                    }
                  },
                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<File?> showUploadPhotoDialog(BuildContext context) async {
  final File? selectedImage = await showDialog<File?>(
    context: context,
    builder: (BuildContext context) => const UploadPhotoDialog(),
  );
  return selectedImage;
}
