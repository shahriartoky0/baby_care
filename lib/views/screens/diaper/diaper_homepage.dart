import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../base/components/app_icon.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/calander_view.dart';
import '../../base/widgets/summary_container.dart';
import 'diaper_details.dart';

class DiaperHomePage extends StatelessWidget {
  final DateTime selectedDate;

  const DiaperHomePage({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: AppFloatingButton(
        iconPath: AppIcons.diaperIcon,
        onPressed: () {
          Get.to(() => DiaperDetails());
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const AppBarRegular(title: 'Diaper'),

              /// ================================ CALENDAR VIEW ==============>
              CalendarView(dateSelected: selectedDate),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Summary', style: textTheme.titleMedium?.copyWith(fontSize: 20)),
                    Text('Diaper trends for today', style: textTheme.labelSmall),

                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8,
                      runSpacing: 10,
                      children: <Widget>[
                        SummaryContainer(textTheme: textTheme, title: 'Skin', content: 'Rash'),
                        SummaryContainer(textTheme: textTheme, title: 'Diaper', content: 'Dry'),
                        SummaryContainer(
                          textTheme: textTheme,
                          title: 'Total Duration',
                          content: '6 Hours',
                        ),

                        Divider(color: Colors.grey.withValues(alpha: 0.6)),
                      ],
                    ),
                    Text('Timeline', style: textTheme.titleMedium?.copyWith(fontSize: 20)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text('Nursed, 4 m 24 s'),
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
