import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:together_baby/views/screens/growth/growth_add_page.dart';
import '../../base/components/app_icon.dart';
import '../../base/widgets/app_bar.dart';
import '../../base/widgets/app_floating_button.dart';
import '../../base/widgets/calander_view.dart';
import '../../base/widgets/custom_row_widget.dart';

class GrowthHomepage extends StatelessWidget {
  final DateTime selectedDate;

  const GrowthHomepage({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: AppFloatingButton(
        iconPath: AppIcons.growthIcon,
        onPressed: () {
          Get.to(() =>   GrowthAddScreen());
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppBarRegular(title: 'Growth'),

              /// ================================ CALENDAR VIEW ==============>
              CalendarView(dateSelected: selectedDate),
              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Summary', style: textTheme.titleMedium?.copyWith(fontSize: 20)),
                    Text(
                      'Growth trends so far ( The bar chart goes here ) ',
                      style: textTheme.labelSmall,
                    ),
                    const SizedBox(height: 16),
                    // Text('Schedule', style: textTheme.titleMedium?.copyWith(fontSize: 20)),
                    // const SizedBox(height: 16),

                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: CustomRowWidget(
                            text1: 'Height : 2 Feet 5 inch \nWeight : 80 pound',
                            text2: '',
                            timeText: '5 June ,2025',
                            onTap: () {},
                            deletePressed: () {},
                            // Optional, can be omitted
                            showDeleteButton: false,
                          ),
                        );
                      },

                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
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
