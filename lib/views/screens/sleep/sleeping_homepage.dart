import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/views/screens/pumping/pumping_add.dart';
import 'package:together_baby/views/screens/sleep/sleeping_add.dart';

import '../../base/components/app_icon.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/calander_view.dart';
import '../../base/widgets/summary_container.dart';

class SleepHomepage extends StatelessWidget {
  final DateTime selectedDate;

  const SleepHomepage({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: AppFloatingButton(
        iconPath: AppIcons.sleepingIcon,
        onPressed: () {
          Get.to(() => AddSleeping());
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AppBarRegular(title: 'Sleep'),

              /// ================================ CALENDAR VIEW ==============>
              CalendarView(dateSelected: selectedDate),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Summary', style: textTheme.titleMedium?.copyWith(fontSize: 20)),
                    Text('Pumping trends for today', style: textTheme.labelSmall),

                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8,
                      runSpacing: 10,
                      children: <Widget>[
                        SummaryContainer(textTheme: textTheme, title: 'Day', content: '2m:5s'),
                        SummaryContainer(textTheme: textTheme, title: 'Night', content: '2m:5s'),

                        SummaryContainer(
                          textTheme: textTheme,
                          title: 'Time',
                          content: '18/06/25 08:30PM',
                        ),
                        Divider(color: Colors.grey.withValues(alpha: 0.6)),
                      ],
                    ),
                    Text('Timeline', style: textTheme.titleMedium?.copyWith(fontSize: 20)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Day (3h:2m:12s)\nNight (9h:2m:12s)', style: textTheme.titleSmall),
                        Text(
                          'Jun 17, 2025',
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'By Carole K. Strand',
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '09:31am',
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
