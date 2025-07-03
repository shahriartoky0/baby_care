import 'package:flutter/material.dart';

import '../../../base/widgets/app_floating_button.dart';
import '../../../base/widgets/calander_view.dart';

import '../../../base/widgets/summary_container.dart';

class FormulaHomepage extends StatelessWidget {
  final DateTime selectedDate;

  const FormulaHomepage({super.key, required this.selectedDate});

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
              Text('Formula trends for today', style: textTheme.labelSmall),
              const SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 10,
                children: <Widget>[
                  SummaryContainer(textTheme: textTheme, title: 'Type', content: 'Cow Milk'),
                  SummaryContainer(textTheme: textTheme, title: 'Amount', content: '20.00 ml'),
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
                  Text(
                    'Cow Milk',
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
              Text(
                'Cow milk: 20.00 ml',
                style: textTheme.labelSmall?.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
