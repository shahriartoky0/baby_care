import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:together_baby/views/base/components/custom_svg.dart';
import 'package:together_baby/views/screens/growth/growth_add_page.dart';
import '../../base/components/app_icon.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/calander_view.dart';
import '../../base/widgets/custom_row_widget.dart';
import '../../base/widgets/summary_tile.dart';

class BabySummary extends StatelessWidget {
  final DateTime selectedDate;

  const BabySummary({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: AppFloatingButton(
        iconPath: AppIcons.growthIcon,
        onPressed: () {
          Get.to(() => GrowthAddScreen());
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppBarRegular(title: 'Summary'),

              /// ================================ CALENDAR VIEW ==============>
              CalendarView(dateSelected: selectedDate),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Today's Summary", style: textTheme.titleMedium?.copyWith(fontSize: 20)),

                    const SizedBox(height: 16),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return SummaryTile(
                          iconAsset: AppIcons.feedingIcon,
                          title: 'Sleep, 2 hours 15 minutes',
                          date: 'Jun 17, 2025',
                          authorName: 'By Jane Smith',
                          time: '07:00am',
                          backgroundColor: AppColors.primaryColor,
                          customBottomWidget: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.pageColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text('Deep sleep detected'),
                          ),
                        ) ;
                      },

                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox();
                      },
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
             ],
          ),
        ),
      ),
    );
  }
}



