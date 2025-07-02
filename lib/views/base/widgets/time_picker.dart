import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../utilities/app_colors.dart';

class TimePickerWidget extends StatelessWidget {
  final String label;
  final Rx<DateTime> time;
  final Function(DateTime) onTimeSelected;

  const TimePickerWidget({
    super.key,
    required this.label,
    required this.time,
    required this.onTimeSelected,
  });

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(time.value),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // Customize the primary color
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      final DateTime newTime = DateTime(
        time.value.year,
        time.value.month,
        time.value.day,
        selectedTime.hour,
        selectedTime.minute,
      );
      onTimeSelected(newTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        Text(label, style: textTheme.headlineMedium),
        const Spacer(),
        Obx(
          () => TextButton(
            onPressed: () => _selectTime(context),
            child: Text(
              '${time.value.hour}:${time.value.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
