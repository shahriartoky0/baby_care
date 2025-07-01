
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utilities/app_colors.dart';

class SummaryContainer extends StatelessWidget {
  const SummaryContainer({
    super.key,
    required this.textTheme,
    required this.title,
    required this.content,
  });

  final TextTheme textTheme;
  final String title;

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      // width: Get.width * 0.45,
      // width: MediaQuery.of(context).size.width * 0.45,
      width:180,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 1),
            // spreadRadius: 2,
            blurRadius: 3,
            color: Colors.grey,
          ),
        ],
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.modalIconInnerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: textTheme.headlineMedium),
          const SizedBox(height: 3),
          Text(
            content,
            style: textTheme.displayMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}