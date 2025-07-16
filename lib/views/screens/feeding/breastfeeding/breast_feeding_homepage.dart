import 'package:flutter/material.dart';

import '../../../base/widgets/app_floating_button.dart';
import '../../../base/widgets/calander_view.dart';
import '../../../base/widgets/summary_container.dart';

class BreastFeedingHomepage extends StatelessWidget {
  final DateTime selectedDate;

  const BreastFeedingHomepage({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        /// ================================ CALENDAR VIEW ==============>
        CalendarView(dateSelected: selectedDate),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Summary', style: textTheme.titleMedium?.copyWith(fontSize: 20)),
              const SizedBox(height: 12),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 8,
                  runSpacing: 10,
                  children: <Widget>[
                    SummaryContainer(textTheme: textTheme, title: 'Left', content: '2m:5s'),
                    SummaryContainer(textTheme: textTheme, title: 'Right', content: '2m:5s'),
                    SummaryContainer(
                      textTheme: textTheme,
                      title: 'Total Duration',
                      content: '5 min',
                    ),
                    SummaryContainer(
                      textTheme: textTheme,
                      title: 'Time',
                      content: '18/06/25 08:30PM',
                    ),
                    Divider(color: Colors.grey.withValues(alpha: 0.6)),
                  ],
                ),
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

              /// The left and right ===========>
              const Row(
                spacing: 10,
                children: <Widget>[
                  CircleLetter(),
                  Text('2m:12s'),
                  SizedBox(width: 8),
                  CircleLetter(letter: 'R'),
                  Text('2m:12s'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
