import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/utilities/app_colors.dart';
import 'package:dotted_line/dotted_line.dart';
import '../../base/components/app_icon.dart';
import '../../base/widgets/activity_container.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/calander_view.dart';
import 'edit_plan.dart';

class PlannerHomePage extends StatelessWidget {
  final DateTime selectedDate;

  const PlannerHomePage({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),

        child: PlannerFloatingButton(
          onPressed: () {
            Get.to(() => EditPlanPage(selectedDate: DateTime.now(),));
          },
          label: 'Edit Routine',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppBarRegular(title: 'Daily Planner'),

              /// ================================ CALENDAR VIEW ==============>
              CalendarView(dateSelected: selectedDate),
              const SizedBox(height: 16),
              // const AddPlanContainer(),
              Text('Today’s Routine', style: textTheme.headlineMedium),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: <Widget>[
                  /// TIME ============>
                  const Column(
                    spacing: 50,
                    children: <Widget>[Text('8.16 AM'), Text('8.16 AM'), Text('8.16 AM')],
                  ),
                  const SizedBox(width: 8),
                  const DottedLine(
                    dashColor: Colors.black,
                    dashGapLength: 4,
                    dashLength: 6,
                    lineThickness: 2,
                    direction: Axis.vertical,
                    lineLength: 200, // Short vertical line
                  ),
                  SizedBox(width: 8),
                  Column(
                    spacing: 10,
                    children: <Widget>[
                      ActivityContainer(
                        iconPath: AppIcons.feedingIcon,
                        title: 'Feeding',
                        subtitle: 'BreastFeeding',
                      ),
                      ActivityContainer(
                        iconPath: AppIcons.feedingIcon,
                        title: 'Feeding',
                        subtitle: 'BreastFeeding',
                      ),
                      ActivityContainer(
                        iconPath: AppIcons.feedingIcon,
                        title: 'Feeding',
                        subtitle: 'BreastFeeding',
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}

class PlannerFloatingButton extends StatelessWidget {
  const PlannerFloatingButton({super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;

  final String label;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),

        // Add border radius to InkWell
        splashColor: AppColors.primaryColor.withValues(alpha: 0.5),
        highlightColor: Colors.transparent,
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: Center(child: Text(label, style: textTheme.headlineMedium)),
        ),
      ),
    );
  }
}
