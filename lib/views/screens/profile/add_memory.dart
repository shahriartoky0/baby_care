import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/views/base/widgets/app_bar.dart';
import 'package:together_baby/views/base/widgets/select_button.dart';
import 'package:together_baby/views/base/widgets/upload_photo_diaologe.dart';
import '../../../controller/button_controller.dart';
import '../../../controller/manual_time_controller.dart';
import '../../../utilities/app_colors.dart';
import '../../base/components/custom_text_field.dart';
import '../../base/components/reusable_date_picker_field.dart';
import '../../base/widgets/time_picker.dart';

class AddMemoryPage extends StatelessWidget {
  const AddMemoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonController controller = Get.put(ButtonController());

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AppBarRegular(title: 'Add Memory'),
              const SizedBox(height: 12),
              SelectButtonWidget(
                buttonLabels: const <String>['Image', 'Video'],
                controller: controller,
              ),
              Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return ImageAddingPage();
                  case 1:
                    return ImageAddingPage(forVideo: true);

                  default:
                    return const Text("Select an option", style: TextStyle(fontSize: 20));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageAddingPage extends StatelessWidget {
  final bool forVideo;

  ImageAddingPage({super.key, this.forVideo = false});

  final TextEditingController _weightTEController = TextEditingController();
  final TextEditingController _imageDateTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ManualTimeController timeController = Get.put(ManualTimeController());

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                boxShadow: <BoxShadow>[
                  const BoxShadow(blurRadius: 4, spreadRadius: 2, color: Colors.grey),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ReusableDatePickerField(
                          prefixIcon: const Icon(CupertinoIcons.calendar_today),
                          hintText: 'Select Date',
                          controller: _imageDateTEController,
                          color: AppColors.pageColor,
                        ),
                        // Left Side Time Pickers
                        TimePickerWidget(
                          showTimeIcon: true,
                          label: 'Time',
                          time: timeController.startLeftTime,
                          onTimeSelected: timeController.updateStartLeftTime,
                        ),
                        const Divider(),
                        const SizedBox(height: 12),
                        MyTextFormFieldWithIcon(
                          borderColor: Colors.grey.shade300,
                          formHintText: 'Title',
                          controller: _weightTEController,
                          validator: (String? value) {
                            if (value?.isEmpty ?? true) {
                              return "Don't leave empty";
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                            boxShadow: <BoxShadow>[
                              const BoxShadow(blurRadius: 3, color: Colors.grey),
                            ],
                          ),
                          child: UploadPhotoDialog(forVideo: forVideo),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
