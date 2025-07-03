import 'package:flutter/material.dart';
import '../../../base/widgets/calander_view.dart';
import '../../../base/widgets/summary_container.dart';

class SolidHomePage extends StatelessWidget {
  final DateTime selectedDate;

  const SolidHomePage({super.key, required this.selectedDate});

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
              Text('Solids trends for today', style: textTheme.labelSmall),
              const SizedBox(height: 12),
              const Divider(),
               const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Solids Fed',
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
                'Beef: (50 gm) Chicken: (50 gm) Vegetable: (50 gm)  ',
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
