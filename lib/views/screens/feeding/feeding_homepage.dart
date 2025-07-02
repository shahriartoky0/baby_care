import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:together_baby/views/base/components/app_icon.dart';
import 'package:together_baby/views/base/widgets/calander_view.dart';
import '../../../controller/button_controller.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/select_button.dart';
import '../../base/widgets/summary_container.dart';
import 'breastfeeding/add_breastfeeding.dart';

class FeedingHomepage extends StatelessWidget {
  const FeedingHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Getting Printed =====> ');

    final ButtonController controller = Get.put(ButtonController());

    DateTime selectedDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: AppFloatingButton(
        iconPath: AppIcons.feedingIcon,
        onPressed: () {
          Get.to(() => AddBreastfeeding());
        },
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppBarRegular(title: 'Feedback'),
              SelectButtonWidget(
                buttonLabels: const <String>['Breastfeeding', 'Formula', 'Solid'],
                controller: controller,
              ),
              Obx(() {
                switch (controller.selectedIndex.value) {
                  case 0:
                    return const Text("Breastfeeding Content", style: TextStyle(fontSize: 20));
                  case 1:
                    return const Text("Formula Content", style: TextStyle(fontSize: 20));
                  case 2:
                    return const Text("Solid Food Content", style: TextStyle(fontSize: 20));
                  default:
                    return const Text("Select an option", style: TextStyle(fontSize: 20));
                }
              }),

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
                        alignment: WrapAlignment.center,
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
          ),
        ),
      ),
    );
  }
}
